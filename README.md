# `bingo-os`

[![build-bingo-os](https://github.com/briann/bingo-os/actions/workflows/build.yml/badge.svg)](https://github.com/briann/bingo-os/actions/workflows/build.yml)

## TLDR
- This is a customized OS built for `@briann`'s development setup. No guarantees this will work on anything except for my own devices, but you're welcome to try!
- Forked / using [Universal Blue](https://universal-blue.org/)'s [ublue-os/startingpoint](https://github.com/ublue-os/startingpoint), based on the [ublue-os/silverblue-main](https://github.com/ublue-os/main) images, and inspired by [Bluefin](https://github.com/ublue-os/bluefin).
- For more information about customizations made on top of the base image, see the 

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
1. After booting into the signed image, rebase onto the signed image:
   ```
   rpm-ostree rebase ostree-image-signed:docker://ghcr.io/briann/bingo-os:latest
   ```
   and reboot once finished:
   ```
   systemctl reboot
   ```

## Customizations

### Packages (layered RPMs)

See [`recipe.yml`](config/recipe.yml).

### Flatpaks

See [`recipe.yml`](config/recipe.yml).

### Kernel modifications

See [`recipe.yml`](config/recipe.yml).

### Additional tweaks

See [r`ecipe.yml`](config/recipe.yml).

### `/etc` files

Are located in [`config/files/etc`](config/files/etc/) and are copied to `/etc`. This provides `yum` repository definitions needed for image construction.

### `/usr` files

Are located in [`config/files/usr`](config/files/usr/) and are copied to `/usr`. 

#### Gnome configs

Are provided in the [`config/files/usr/etc/dconf/db/local.d`](config/files/usr/etc/dconf/db/local.d/) directory. Currently this sets:
- Default wallpaper (wallpapers images are in [`config/files/usr/share/backgrounds`](config/files/usr/share/backgrounds/)).
- ...

#### `just` scripts

TBD

## Development

- [`template`](https://github.com/briann/bingo-os/tree/template) branch should track [ublue-os/startingpoint's `template`](https://github.com/ublue-os/startingpoint/tree/template) branch.
- [`live`](https://github.com/briann/bingo-os/tree/live) should pull in changes from `template`. This is the main development branch and images are automatically built off of changes on this branch.
