screenshots from the past
-------------------------

scripts to help analyze the strange behaviour of some screenshot tools
which produce screenshots from the past.

situation: some screenshot tools like scrot or import from imagemagick
will not produce current screenshots and instead produce a repeat
from past invocations of the tools.

the first invocation in a clean gnome session will always produce
a current screenshot. the following invocations will either produce
a current screenshot or a repeat of a previous invocation.

a clean gnome session is one which was just booted and no screenshots
made yet.

with increasing number of repeats the chance to produce a current screenshot
goes towards zero. typically there will be three current screenshots
while the rest are repeats of the three.

these scripts were written to help analyze this behaviour.

how to use
----------

setup:

1. restart gnome: alt+f2 -> r
2. put terminal fullscreen: F11
3. disable blinking cursor: tput civis
4. clear terminal: clear

screenshot and analyze

1. create screenshots: ./screenshots -r10 dirname
2. analyze: ./analyze

6. reset cursor (tput cnorm)

links
-----

read the story here: https://bbs.archlinux.org/viewtopic.php?id=216500

others that seem to have the same or similar problem with screenshots

https://forums.raspberrypi.com/viewtopic.php?t=156692

https://askubuntu.com/questions/312928/issue-with-grabbing-screen-screenshots

https://stackoverflow.com/questions/31774135/gtkmm-always-same-image-when-taking-screenshot

license
-------

copyright Lesmana Zimmer

This program is free software.
It is licensed under the WTFPL version 2.
That means that you can do what the fuck
you want to with this program.
For details see http://www.wtfpl.net/about/
