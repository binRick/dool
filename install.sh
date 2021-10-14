#!/usr/bin/env bash
set -e
cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
#set -x
make install
rsync dool.conf /etc/sysconfig/dool.conf
rsync dool-profile.sh /etc/profile.d/dool.sh
ln -sf $(command -v dool) $(command -v dstat||echo /usr/bin/dstat)
#source /etc/profile.d/dool.sh
#command -v dool
#command -v dstat
#timeout 1 dool ||true
#timeout 1 dool||true
#timeout 1 dstat ||true
#timeout 1 dstat||true
