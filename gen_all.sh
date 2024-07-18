#!/bin/bash
# VERBOSE=1
# SCHEMA='analytics_dev.dev_lgryglicki_'
# SKIP_CONTRIBUTORS=1
# SKIP_ORGANIZATIONS=1
# SKIP_PROJECTS=1
# SKIP_REPOSITORIES=1
# SKIP_PLATFORMS=1

# Contributors now, last 12 months, last 10 years
if [ -z "${SKIP_CONTRIBUTORS}" ]
then
  ./pki_report.sh number_of_contributors_now
  ./pki_report_range.sh number_of_contributors_range year
  ./pki_report_range.sh number_of_contributors_range month
fi

# Organizations now, last 12 months, last 10 years
if [ -z "${SKIP_ORGANIZATIONS}" ]
then
  ./pki_report.sh number_of_organizations_now
  ./pki_report_range.sh number_of_organizations_range year
  ./pki_report_range.sh number_of_organizations_range month
fi

# Projects now, last 12 months, last 10 years
if [ -z "${SKIP_PROJECTS}" ]
then
  ./pki_report.sh number_of_projects_now
  ./pki_report_range.sh number_of_projects_range year
  ./pki_report_range.sh number_of_projects_range month
fi

# Repositories now, last 12 months, last 10 years
if [ -z "${SKIP_REPOSITORIES}" ]
then
  ./pki_report.sh number_of_repositories_now
  ./pki_report_range.sh number_of_repositories_range year
  ./pki_report_range.sh number_of_repositories_range month
fi

# Platforms now, last 12 months, last 10 years
if [ -z "${SKIP_PLATFORMS}" ]
then
  ./pki_report.sh number_of_platforms_now
  ./pki_report_range.sh number_of_platforms_range year
  ./pki_report_range.sh number_of_platforms_range month
fi
