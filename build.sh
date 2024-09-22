#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Mount luks volumes protected by user password
# Add KDE PIM
# Remove GUI for firewalld
rpm-ostree install pam_mount	\
	kdepim-addons				\
	kmail						\
	merkuro						\
	tokodon						\
	neochat						\
	rsms-inter-fonts			\
	jetbrains-mono-fonts 		\
	gwenview					\
	kcalc						\
	okular						\
	steam						\
	wine						\
	wine-mono					\
	syncthing					\
	gamescope					\
	--uninstall firewall-config

# Remove .desktop file for wine applications
rm /usr/share/applications/wine-*.desktop

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Do not wait on network during boot
systemctl disable NetworkManager-wait-online.service
