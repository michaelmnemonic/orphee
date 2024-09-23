#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Mount luks volumes protected by user password
# Add KDE PIM
# Remove GUI for firewalld
rpm-ostree install				\
	AusweisApp2					\
	gamescope					\
	gwenview					\
	jetbrains-mono-fonts 		\
	kcalc						\
	kdepim-addons				\
	kmail						\
	kmymoney					\
	langpacks-de				\
	libreoffice-calc			\
	libreoffice-impress			\
	libreoffice-kf6				\
	libreoffice-langpack-de		\
	libreoffice-writer			\
	merkuro						\
	neochat						\
	okular						\
	pam_mount					\
	rsms-inter-fonts			\
	skanpage					\
	steam						\
	syncthing					\
	tokodon						\
	wine						\
	wine-mono

# Remove unneded applications
rpm-ostree uninstall			\
	dosbox-staging				\
	nvtop

# Remove preinstalled applications
rpm-ostree override remove firewall-config

# Remove .desktop file for wine applications
sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' /usr/share/applications/wine-*.desktop

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Do not wait on network during boot
systemctl disable NetworkManager-wait-online.service
