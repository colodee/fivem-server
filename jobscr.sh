#!/bin/bash


# crontab -e
# @reboot /root/jobscr.sh pma-4879
# 0 6 * * * /root/jobscr.sh pma-4879
# 0 12 * * * /root/jobscr.sh pma-4879
# 0 18 * * * /root/jobscr.sh pma-4879
# 0 0 * * * /root/jobscr.sh pma-4879


scr=$(/bin/ps -ef | grep FXServer | grep SCREEN | grep $1)
pid=$(echo $scr | awk '{printf $2}')

[[ -n $pid ]] && \
(( $pid >= 1 )) \
&& echo "Kill Screen (Name=$1, PID=$pid)" \
&& echo "$(kill $pid)"

sleep 5

newscr=$(screen -dmS "$1" bash /root/$1/FXServer/server/run.sh +set txAdminPort 40120)

echo $newscr
