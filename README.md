# `bingo-os`

[![build-bingo-os](https://github.com/briann/bingo-os/actions/workflows/build.yml/badge.svg)](https://github.com/briann/bingo-os/actions/workflows/build.yml)

## TLDR
- This is a customized OS built for @briann's development setup. No guarantees this will work on anything except for my own devices, but you're welcome to try!
- Forked / using [Universal Blue](https://universal-blue.org/)'s [ublue-os/startingpoint](https://github.com/ublue-os/startingpoint), based on the [ublue-os/silverblue-main](https://github.com/ublue-os/main) images, and inspired by [Bluefin](https://github.com/ublue-os/bluefin).
- For more information about customizations made on top of the base image, see the [Customizations](#customizations) section below.

## Installation
1. Install Silverblue ([link](https://fedoraproject.org/atomic-desktops/silverblue/))
1. Rebase onto the unsigned image:
   ```
   rpm-ostree rebase ostree-unverified-registry:ghcr.io/briann/bingo-os:latest
   ```
   and reboot once finished:
   ```
   systemctl reboot
   ```
1. After booting into the unsigned image, rebase onto the signed image:
   ```
   rpm-ostree rebase ostree-image-signed:docker://ghcr.io/briann/bingo-os:latest
   ```
   and reboot once finished:
   ```
   systemctl reboot
   ```
1. On first boot, you may want to run `ujust fix-groups` to set the proper docker group.

## Customizations

### Packages (layered RPMs)

See [`recipe-rpm-ostree.yml`](config/recipe-rpm-ostree.yml).

### Flatpaks

See [`recipe-default-flatpaks.yml`](config/recipe-default-flatpaks.yml).

### Fonts

See [`recipe-fonts.yml`](config/recipe-fonts.yml).

### `akmods`

See [`recipe.yml`](config/recipe.yml). Currently the following are loaded:
```
- openrazer
- openrgb
- xpadneo
- xone
- wl
- v4l2loopback
```

### `bling`
See [`recipe.yml`](config/recipe.yml). Currently the following are used:
```
- ublue-update
- dconf-update-service
- 1password
```

### `systemd`
See [`recipe.yml`](config/recipe.yml). Currently the following services are enabled:
```
- tuned.service
- tailscaled.service
- dconf-update.service
- ublue-update.timer
- docker.socket
```

### Files

**`/etc` files**: Are located in [`config/files/etc`](config/files/etc/) and are copied to `/etc`. This includes:
- `yum` repository definitions needed for image construction.
- [`ublue-update.toml`](config/files/etc/ublue-update/ublue-update.toml) to configure `ublue-update`.

**`/usr` files**: Are located in [`config/files/usr`](config/files/usr/) and are copied to `/usr`.  This provides:
- System config files:
   - [`/usr/etc/sysctl.conf`](config/files/usr/etc/sysctl.conf) which sets `fs.file-max`.
   - [`/usr/lib/sysctl.d/*.conf`](config/files/usr/lib/sysctl.d/) which set `fs.inotify` and docker configs.
- Wallpaper image files in [`/usr/share/backgrounds`](config/files/usr/share/backgrounds/).
- Just scripts in [`/usr/share/ublue-os/just`](config/files/usr/share/ublue-os/just/60-custom.just) - currently just providing `fix-groups`.

### Gnome settings
Are defined in [`zz1-bingo-os.gschema.override`](config/gschema-overrides/zz1-bingo-os.gschema.override).


## Development

- [`template`](https://github.com/briann/bingo-os/tree/template) branch should track [ublue-os/startingpoint's `template`](https://github.com/ublue-os/startingpoint/tree/template) branch.
- [`live`](https://github.com/briann/bingo-os/tree/live) should pull in changes from `template`. This is the main development branch and images are automatically built off of changes on this branch.
