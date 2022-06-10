#! /bin/bash

# screenshots from past
# Copyright Lesmana Zimmer
# Licensed under WTFPL version 2
# http://www.wtfpl.net/about/

trap 'echo error exit ; kill 0' EXIT

workdir=screenshots
pattern=pat
show1=

for arg ; do
  case $arg in
    png) pattern=png ;;
    pat) pattern=pat ;;
    1) show1=yes ;;
    *) workdir=$arg ;;
  esac
done


echo "workdir $workdir"
echo "pattern $pattern"
echo "show1 ${show1:-no}"

test -d $workdir || {
  echo "no directory $workdir"
  exit 1
}

find $workdir | grep $pattern |
  sort | xargs md5sum | awk -v show1=$show1 -f dups.awk

trap - EXIT
echo "normal exit"
