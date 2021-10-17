#!/usr/bin/env bash
set -e
cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
if ! command rsync; then
	alias rsync=$(command -v cp)
fi
#set -x
if ! command -v make; then
<<<<<<< HEAD
	cp ./dool /usr/bin/dool && chmod +x /usr/bin/dool
=======
	rsync ./dool /usr/bin/dool && chmod +x /usr/bin/dool
>>>>>>> 06c819a6eb79b8e21588f42b6473c59ad8981915
else
	make install
fi
if ! command -v rsync; then
<<<<<<< HEAD
	cp dool.conf /etc/sysconfig/dool.conf
	cp dool-profile.sh /etc/profile.d/dool.sh
else
	rsync dool.conf /etc/sysconfig/dool.conf
	rsync dool-profile.sh /etc/profile.d/dool.sh
=======
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
>>>>>>> 06c819a6eb79b8e21588f42b6473c59ad8981915
fi
ln -sf $(command -v dool) $(command -v dstat || echo /usr/bin/dstat)
#source /etc/profile.d/dool.sh
#command -v dool
#command -v dstat
#timeout 1 dool ||true
#timeout 1 dool||true
#timeout 1 dstat ||true
#timeout 1 dstat||true
