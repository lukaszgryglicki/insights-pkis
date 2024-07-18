select
  count(distinct member_id) as contributors
from
  analytics.silver_fact.code_contributions
where
  not member_is_bot
