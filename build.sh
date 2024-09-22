#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Mount luks volumes protected by user password
rpm-ostree install pam_mount \
	# Add KDE PIM
	kdepim-addons \
	kmail \
	merkuro \
	# Remove GUI for firewalld 
	--uninstall firewall-config

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
