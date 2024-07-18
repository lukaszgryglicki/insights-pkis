select
  count(distinct member_id) as contributors
from
  {{schema}}silver_fact.code_contributions
where
  not member_is_bot
