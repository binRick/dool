#!/usr/bin/env bash
set -e
cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
if ! command rsync; then
	alias rsync=$(command -v cp)
fi
#set -x
if ! command -v make; then
	rsync ./dool /usr/bin/dool && chmod +x /usr/bin/dool
else
	make install
fi
if ! command -v rsync; then
  if [[ -d /etc/sysconfig ]]; then
	rsync dool.conf /etc/sysconfig/dool.conf
  fi
  if [[ -d /etc/profile.d ]]; then
	rsync dool-profile.sh /etc/profile.d/dool.sh
  fi
else
  if [[ -d /etc/sysconfig ]]; then
	rsync dool.conf /etc/sysconfig/dool.conf
  fi
  if [[ -d /etc/profile.d ]]; then
	rsync dool-profile.sh /etc/profile.d/dool.sh
  fi
fi
ln -sf $(command -v dool) $(command -v dstat || echo /usr/bin/dstat)
#source /etc/profile.d/dool.sh
#command -v dool
#command -v dstat
#timeout 1 dool ||true
#timeout 1 dool||true
#timeout 1 dstat ||true
#timeout 1 dstat||true
