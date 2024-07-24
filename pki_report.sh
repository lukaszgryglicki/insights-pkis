#!/bin/bash
# VERBOSE=1
# SCHEMA='analytics_dev.dev_lgryglicki_'
# ./pki_report.sh number_of_contributors_now
if [ -z "${1}" ]
then
  echo "${0}: you need to specify the report name: ${0} number_of_contributors_now"
  exit 1
fi
if [ -z "${SCHEMA}" ]
then
  SCHEMA="analytics."
fi
cp "${1}.sql" /tmp/rep.sql || exit 2
sed -i "s/{{schema}}/${SCHEMA}/g" /tmp/rep.sql || exit 3
if [ ! -z "${VERBOSE}" ]
then
  cat /tmp/rep.sql
  echo "snowsql_v3_key.sh -o output_file=\"${1}.csv\" -o quiet=true -o friendly=false -o header=true -o output_format=csv < \"/tmp/rep.sql\""
fi
rm -rf "${1}.csv" 1>/dev/null 2>/dev/null
snowsql_v3_key.sh -o output_file="${1}.csv" -o quiet=true -o friendly=false -o header=true -o output_format=csv < "/tmp/rep.sql" || exit 4
if [ ! -z "${VERBOSE}" ]
then
  echo "${1}.csv generated:"
  cat "${1}.csv"
fi
