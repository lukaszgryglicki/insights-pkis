with data as (
  select
    c.timestamp as {{range}},
    c.value as all_contributions,
    m.value as all_contributors,
    uc.value as unaffiliated_contributions,
    um.value as unaffiliated_contributors,
  from
    {{schema}}gold_insights.pkis c,
    {{schema}}gold_insights.pkis m,
    {{schema}}gold_insights.pkis uc,
    {{schema}}gold_insights.pkis um
  where
    c.metric = 'contributions'
    and m.metric = 'contributors'
    and uc.metric = 'unaffiliated_contributions'
    and um.metric = 'unaffiliated_contributors'
    and c.type = m.type
    and c.type = uc.type
    and c.type = um.type
    and c.timestamp = m.timestamp
    and c.timestamp = uc.timestamp
    and c.timestamp = um.timestamp
    and c.type in ('{{range}}', 'now')
  order by
    {{range}} asc
)

select
  *,
  100.0* (unaffiliated_contributors / all_contributors) as percent_unaffiliated_contributors,
  100.0* (unaffiliated_contributions / all_contributions) as percent_unaffiliated_contributions
from
  data
