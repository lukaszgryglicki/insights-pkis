select
  current_timestamp()::date as now,
  count(distinct project_id) as projects
from
  {{schema}}silver_dim.project_segments
where
  project_status = 'Active'
