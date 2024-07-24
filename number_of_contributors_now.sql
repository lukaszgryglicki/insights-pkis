select
  i.timestamp as now,
  i.value as identities,
  c.value as contributors
from
  analytics_dev.dev_lgryglicki_gold_insights.pkis i
inner join
  analytics_dev.dev_lgryglicki_gold_insights.pkis c
on
  i.type = c.type
  and i.timestamp = c.timestamp
where
  i.metric = 'identities'
  and c.metric = 'contributors'
  and i.type = 'now'
