#!/bin/sh

set -euo pipefail

URL="https://github.com/ArchiveTeam/Ubuntu-Warrior/releases/download/v3.2/archiveteam-warrior-v3.2-20210306.ova"
F=$(basename "$URL")

if [ ! -e "$F" ]; then
  wget "$URL"
fi

T=$(mktemp -d)
FR=$(readlink -f "$F")
META=$(readlink -f metadata.yaml)

pushd "$T"

tar xvf "$FR"
qemu-img convert -O qcow2 *.vmdk archivewarrior.img

export CREATION_DATE=$(date +%s)
export FILENAME="$F"
export RELEASE=$(echo "$F" | grep "v[0-9][0-9.-]*" -o)

cat "$META" | envsubst > metadata.yaml
tar cvf archivewarrior.tar.xz metadata.yaml --xz
lxc image import archivewarrior.tar.xz archivewarrior.img --alias archivewarrior
