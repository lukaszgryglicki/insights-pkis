#!/bin/bash
# VERBOSE=1
# ./pki_report.sh number_of_contributors_now
if [ -z "${1}" ]
then
  echo "${0}: you need to specify the report name: ${0} number_of_contributors_now"
  exit 1
fi
if [ ! -z "${VERBOSE}" ]
then
  echo "snowsql_v3_key.sh -o output_file=\"${1}.csv\" -o quiet=true -o friendly=false -o header=true -o output_format=csv < \"${1}.sql\""
fi
rm -rf "${1}.csv" 1>/dev/null 2>/dev/null
snowsql_v3_key.sh -o output_file="${1}.csv" -o quiet=true -o friendly=false -o header=true -o output_format=csv < "${1}.sql" || exit 2
if [ ! -z "${VERBOSE}" ]
then
  echo "${1}.csv generated:"
  cat "${1}.csv"
fi
