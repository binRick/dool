#!/usr/bin/env bash
set -e
cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
#set -x
if ! command -v make; then
	cp ./dool /usr/bin/dool && chmod +x /usr/bin/dool
else
	make install
fi
if ! command -v rsync; then
	cp dool.conf /etc/sysconfig/dool.conf
	cp dool-profile.sh /etc/profile.d/dool.sh
else
	rsync dool.conf /etc/sysconfig/dool.conf
	rsync dool-profile.sh /etc/profile.d/dool.sh
fi
ln -sf $(command -v dool) $(command -v dstat || echo /usr/bin/dstat)
#source /etc/profile.d/dool.sh
#command -v dool
#command -v dstat
#timeout 1 dool ||true
#timeout 1 dool||true
#timeout 1 dstat ||true
#timeout 1 dstat||true
