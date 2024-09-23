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
	kmymoney					\
	AusweisApp2					\
	libreoffice-calc			\
	libreoffice-writer			\
	libreoffice-impress			\
	libreoffice-langpack-de		\
	libreoffice-kf6			\
	--uninstall firewall-config

# Enable tpm unlock during boot
rpm-ostree initramfs --enable --arg=--force-add --arg=tpm2-tss

# Remove .desktop file for wine applications
rm /usr/share/applications/wine-*.desktop

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Do not wait on network during boot
systemctl disable NetworkManager-wait-online.service
