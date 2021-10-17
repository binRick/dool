#!/usr/bin/env bash
set -e
cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if ! command -v make >/dev/null; then
	cp ./dool /usr/bin/dool
  chmod +x /usr/bin/dool
else
	make install
fi

cp dool.conf /etc/sysconfig/dool.conf
cp dool-profile.sh /etc/profile.d/dool.sh

ln -sf $(command -v dool) $(command -v dstat || echo /usr/bin/dstat)
