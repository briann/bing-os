#!/usr/bin/env bash

set -oue pipefail

systemctl enable tuned.service
systemctl enable rpm-ostree-countme.service
systemctl enable tailscaled.service
systemctl enable dconf-update.service
systemctl enable ublue-update.timer
systemctl enable docker.socket