#!/bin/bash
# VERBOSE=1
# FLY=1 - use "on the fly version"
# SCHEMA='analytics_dev.dev_lgryglicki_'
# ./pki_report_range.sh number_of_contributors_range year|month
if [ -z "${1}" ]
then
  echo "${0}: you need to specify the report name: ${0} number_of_contributors_now"
  exit 1
fi
if [ -z "${2}" ]
then
  echo "${0}: you need to specify the report range: year, month"
  exit 2
fi
if [ -z "${SCHEMA}" ]
then
  SCHEMA="analytics."
fi
if [ -z "${FLY}" ]
then
  cp "${1}.sql" /tmp/rep.sql || exit 3
else
  cp "${2}s.sql" /tmp/rep.sql || exit 4
  cat "on-the-fly/${1}.sql" >> /tmp/rep.sql || exit 5
fi
sed -i "s/{{range}}/${2}/g" /tmp/rep.sql || exit 6
sed -i "s/{{schema}}/${SCHEMA}/g" /tmp/rep.sql || exit 7
if [ ! -z "${VERBOSE}" ]
then
  cat /tmp/rep.sql
  echo "snowsql_v3_key.sh -o output_file=\"${1}_${2}.csv\" -o quiet=true -o friendly=false -o header=true -o output_format=csv < \"/tmp/rep.sql\""
fi
rm -rf "${1}_${2}.csv" 1>/dev/null 2>/dev/null
snowsql_v3_key.sh -o output_file="${1}_${2}.csv" -o quiet=true -o friendly=false -o header=true -o output_format=csv < "/tmp/rep.sql" || exit 8
if [ ! -z "${VERBOSE}" ]
then
  echo "${1}_${2}.csv generated:"
  cat "${1}_${2}.csv"
fi
