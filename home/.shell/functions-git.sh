# Note: Using negative number will work as addition
git-amend-date-subtract-seconds() {

  export offsetSeconds="$1"

  # Use Perl instead of date command as a standard solution (GNU date / BSD date has different options)
  amendDate=$(perl -MPOSIX -e 'print strftime("%a, %e %b %Y %H:%M:%S %z", localtime(time - $ENV{'offsetSeconds'}))')

  GIT_COMMITTER_DATE="$amendDate" git commit --amend --no-edit --date "$amendDate"
}

git-amend-date-subtract-minutes() {
  git-amend-date-subtract-seconds $(bc <<< "${1} * 60")
}

git-amend-date-subtract-hours() {
  echo ""
  git-amend-date-subtract-seconds $(bc <<< "${1} * 3600")
}

