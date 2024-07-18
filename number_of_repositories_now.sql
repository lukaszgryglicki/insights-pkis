select
  current_timestamp()::date as now,
  count(distinct repository_url) as repositories
from
  {{schema}}silver_insights.segment_repos
