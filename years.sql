with current_year as (
  select date_trunc('year', current_timestamp())::date as year
),

years as (
  select dateadd(year, -10, year) as year from current_year
  union select dateadd(year, -9, year) from current_year
  union select dateadd(year, -8, year) from current_year
  union select dateadd(year, -7, year) from current_year
  union select dateadd(year, -6, year) from current_year
  union select dateadd(year, -5, year) from current_year
  union select dateadd(year, -4, year) from current_year
  union select dateadd(year, -3, year) from current_year
  union select dateadd(year, -2, year) from current_year
  union select dateadd(year, -1, year) from current_year
  union select year from current_year
  union select current_timestamp()
)
