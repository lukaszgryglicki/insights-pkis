select
  r.{{range}}::date as {{range}},
  count(distinct a.platform) as platforms
from
  {{schema}}bronze_fivetran_crowd_dev.activities a
inner join
  {{range}}s r
on
  a.created_at <= r.{{range}}
where
  a.platform != 'other'
group by
  {{range}}
order by
  {{range}} asc
