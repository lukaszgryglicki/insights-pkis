#!/bin/bash
# VERBOSE=1
# SCHEMA='analytics_dev.dev_lgryglicki_'
# SKIP_CONTRIBUTORS=1
# SKIP_ORGANIZATIONS=1
# SKIP_PROJECTS=1
# SKIP_REPOSITORIES=1
# SKIP_PLATFORMS=1
# SKIP_UNAFFILIATED=1
# SKIP_ISSUES=1
# SKIP_PULLREQUESTS=1
# SKIP_COMMITS=1

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

# Unaffiliated now, last 12 months, last 10 years
if [ -z "${SKIP_UNAFFILIATED}" ]
then
  ./pki_report.sh number_of_unaffiliated_now
  ./pki_report_range.sh number_of_unaffiliated_range year
  ./pki_report_range.sh number_of_unaffiliated_range month
fi

# Issues now, last 12 months, last 10 years
if [ -z "${SKIP_ISSUES}" ]
then
  ./pki_report.sh number_of_issues_now
  ./pki_report_range.sh number_of_issues_range year
  ./pki_report_range.sh number_of_issues_range month
fi

# PRs now, last 12 months, last 10 years
if [ -z "${SKIP_PULLREQUESTS}" ]
then
  ./pki_report.sh number_of_pullrequests_now
  ./pki_report_range.sh number_of_pullrequests_range year
  ./pki_report_range.sh number_of_pullrequests_range month
fi

# Commits now, last 12 months, last 10 years
if [ -z "${SKIP_COMMITS}" ]
then
  ./pki_report.sh number_of_commits_now
  ./pki_report_range.sh number_of_commits_range year
  ./pki_report_range.sh number_of_commits_range month
fi
