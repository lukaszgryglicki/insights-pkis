#!/bin/bash
# VERBOSE=1
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
cp "${2}s.sql" /tmp/rep.sql || exit 3
cat "${1}.sql" >> /tmp/rep.sql || exit 4
sed -i "s/{{range}}/${2}/g" /tmp/rep.sql || exit 5
if [ ! -z "${VERBOSE}" ]
then
  echo "snowsql_v3_key.sh -o output_file=\"${1}.csv\" -o quiet=true -o friendly=false -o header=true -o output_format=csv < \"/tmp/rep.sql\""
fi
rm -rf "${1}.csv" 1>/dev/null 2>/dev/null
snowsql_v3_key.sh -o output_file="${1}_${2}.csv" -o quiet=true -o friendly=false -o header=true -o output_format=csv < "/tmp/rep.sql" || exit 6
if [ ! -z "${VERBOSE}" ]
then
  echo "${1}_${2}.csv generated:"
  cat "${1}_${2}.csv"
fi
