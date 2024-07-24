,lfx_integrations as (
  select
    settings,
    platform,
    created_ts
  from
    {{schema}}bronze_fivetran_crowd_dev.integrations
  where
    is_lfx_tenant
    and platform in ('github', 'git', 'gerrit')
),

github_repositories_from_integrations as (
  select
    regexp_replace(r.value:"url", '\.git$', '') as repository_url,
    created_ts
  from
    lfx_integrations,
    table(flatten(settings:"repos")) r
  where
    platform = 'github'
),

github_repos as (
  select
    url as repository_url,
    created_at,
  from
    {{schema}}bronze_fivetran_crowd_dev.github_repos
  where
    is_lfx_tenant
),

git_repositories as (
  select
    regexp_replace(r.value, '"', '') as repository_url,
    created_ts
  from
    lfx_integrations,
    table(flatten(settings:"remotes")) r
  where
    platform = 'git'
),

gerrit_repositories as (
  select
    settings:"remote":"orgurl" || coalesce('/' || settings:"remote":"space", '') || '/' || r.value as repository_url,
    created_ts
  from
    lfx_integrations,
    table(flatten(settings:"remote":"reponames")) r
  where
    platform = 'gerrit'
),

repositories as (
  select repository_url, created_ts from github_repositories_from_integrations
  union select repository_url, created_at from github_repos
  union select repository_url, created_ts from git_repositories
  union select repository_url, created_ts from gerrit_repositories
)

select
  r.{{range}}::date as {{range}},
  count(distinct rp.repository_url) as repositories
from
  repositories rp
inner join
  {{range}}s r
on
  rp.created_ts <= r.{{range}}
group by
  {{range}}
order by
  {{range}} asc
