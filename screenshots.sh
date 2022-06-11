#! /bin/bash

# screenshots from past
# Copyright Lesmana Zimmer
# Licensed under WTFPL version 2
# http://www.wtfpl.net/about/

trap 'echo error exit ; kill 0' EXIT

tools=""
default_tools="gnome import maim scrot pil"
delay=0
repeat=1
workdir=screenshots

for arg ; do
  case $arg in
    g|gnome) tools="${tools/gnome/} gnome" ;;
    i|import) tools="${tools/import/} import" ;;
    m|maim) tools="${tools/maim/} maim" ;;
    s|scrot) tools="${tools/scrot/} scrot" ;;
    p|pil) tools="${tools/pil/} pil" ;;
    -d*) delay=${arg#-d} ;;
    -r*) repeat=${arg#-r} ;;
    *) workdir=$arg ;;
  esac
done

tools=${tools:-$default_tools}

echo "tools $tools" | tr -s ' '
echo "delay $delay"
echo "repeat $repeat"
echo "workdir $workdir"

seq $delay -1 1 | while read countdown ; do
  echo "delay $countdown"
  sleep 1
done

mkdir $workdir || exit 1
cd $workdir || exit 1

echo "screenshots go"

seq -w $repeat | while read count ; do
  echo "repeat $count"
  sleep 0.5
  for tool in $tools ; do
    case $tool in
      gnome) gnome-screenshot -f gnome-$count.png ; sleep 0.5 ;;
      import) import -window root import-$count.png ;;
      maim) maim maim-$count.png ;;
      scrot) scrot scrot-$count.png ;;
      pil) pilgrab.py pil-$count.png ;;
    esac
  done
done

echo "screenshots done"

for filename in *.png ; do
  echo "png2pat $filename"
  png2pat $filename > ${filename/png/pat}
done

echo "tools $tools" | tr -s ' '
echo "workdir $workdir"

trap - EXIT
echo "normal exit"
