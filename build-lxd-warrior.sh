#!/bin/sh

set -euo pipefail

clean() {
  lxc delete -f warrior
}
trap clean EXIT

lxc launch images:alpine/3.13 warrior

sleep 5s

c() {
  lxc exec warrior "$@"
}

c apk add openssl
c wget https://raw.githubusercontent.com/ArchiveTeam/Ubuntu-Warrior/master/stage.sh
c sh stage.sh

echo "echo 'sh /root/boot.sh >> /warrior.log 2>&1 &' > /etc/local.d/archivewarrior.start && chmod +x /etc/local.d/archivewarrior.start" | c sh -
c rc-update add local

lxc publish warrior --force --alias archivewarrior --public
