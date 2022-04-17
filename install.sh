#!/bin/bash

apt install xz-utils -y

mkdir -p /root/pma-4879/FXServer/server

cd /root/pma-4879/FXServer/server

wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/4879-4f12006546d1025efb34b1fe7de6e9958b3bb975/fx.tar.xz

tar xf fx.tar.xz

git clone https://github.com/citizenfx/cfx-server-data.git /root/pma-4879/FXServer/server-data

cd /root/pma-4879/FXServer/server-data

wget https://raw.githubusercontent.com/colodee/fivem-server/main/server.cfg

cd /root

wget https://raw.githubusercontent.com/colodee/fivem-server/main/jobscr.sh

chmod 775 jobscr.sh

/root/jobscr.sh pma-4879


# crontab -e
# @reboot /root/jobscr.sh pma-4879
# 0 6 * * * /root/jobscr.sh pma-4879
# 0 12 * * * /root/jobscr.sh pma-4879
# 0 18 * * * /root/jobscr.sh pma-4879
# 0 0 * * * /root/jobscr.sh pma-4879

{ crontab -l;
  echo "@reboot /root/jobscr.sh pma-4879";
  echo "0 6 * * * /root/jobscr.sh pma-4879";
  echo "0 12 * * * /root/jobscr.sh pma-4879";
  echo "0 18 * * * /root/jobscr.sh pma-4879";
  echo "0 0 * * * /root/jobscr.sh pma-4879";
} | crontab -
