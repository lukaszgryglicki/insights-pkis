select
  r.{{range}}::date as {{range}},
  count(distinct ps.project_id) as projects
from
  {{schema}}silver_dim.project_segments ps
inner join
  {{schema}}bronze_fivetran_salesforce.projects p
on
  ps.project_id = p.project_id
inner join
  {{range}}s r
on
  p.created_date <= r.{{range}}
where
  ps.project_status = 'Active'
group by
  {{range}}
order by
  {{range}} asc
