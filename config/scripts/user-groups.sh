#!/usr/bin/env bash

set -oue pipefail

wheelarray=($(getent group wheel | cut -d ":" -f 4 | tr  ',' '\n'))
for user in $wheelarray
do
  usermod -aG docker $user
  usermod -aG libvirt $user
done
