#!/bin/bash

# Credit/OriginalSrc: http://peter-butkovic.blogspot.com/2013/08/tail-inotify-resources-exhausted.html
if [[ $(cat /etc/sysctl.conf | grep max_user_watches) == "" ]]; then
  printf "NOTICE: Patching sysctl.conf ...\n"
  sudo sh -c 'echo fs.inotify.max_user_watches=1048576 >> /etc/sysctl.conf'
else
  printf "Info: sysctl already patched.\n"
fi


