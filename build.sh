#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Mount luks volumes protected by user password
rpm-ostree install pam_mount

mkdir -p /etc/authselect/custom/lukshome/
mv /tmp/lukshome/* /etc/authselect/custom/lukshome/
rmdir /tmp/lukshome

authselect enable custom/lukshome

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
