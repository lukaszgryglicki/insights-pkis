with current_month as (
  select date_trunc('month', current_timestamp())::date as month
),

months as (
  select dateadd(month, -12, month) as month from current_month
  union select dateadd(month, -11, month) from current_month
  union select dateadd(month, -10, month) from current_month
  union select dateadd(month, -9, month) from current_month
  union select dateadd(month, -8, month) from current_month
  union select dateadd(month, -7, month) from current_month
  union select dateadd(month, -6, month) from current_month
  union select dateadd(month, -5, month) from current_month
  union select dateadd(month, -4, month) from current_month
  union select dateadd(month, -3, month) from current_month
  union select dateadd(month, -2, month) from current_month
  union select dateadd(month, -1, month) from current_month
  union select month from current_month
  union select current_timestamp()
)
