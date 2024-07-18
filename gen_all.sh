#!/bin/bash
# VERBOSE=1
./pki_report.sh number_of_contributors_now
./pki_report_range.sh number_of_contributors_range year
./pki_report_range.sh number_of_contributors_range month
