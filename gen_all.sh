#!/bin/bash
# VERBOSE=1

# Contributors now, last 12 months, last 10 years
./pki_report.sh number_of_contributors_now
./pki_report_range.sh number_of_contributors_range year
./pki_report_range.sh number_of_contributors_range month

# Organizations now, last 12 months, last 10 years
./pki_report.sh number_of_organizations_now
./pki_report_range.sh number_of_organizations_range year
./pki_report_range.sh number_of_organizations_range month
