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
	pcsc-cyberjack				\
	rsms-inter-fonts			\
	skanpage					\
	steam						\
	syncthing					\
	wine-core					\
	wine-mono					\
	wine-pulseaudio

# Remove unneded applications
rpm-ostree uninstall			\
	nvtop

# Remove preinstalled applications
rpm-ostree override remove firewall-config

# Hide application entries for syncthing
sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' /usr/share/applications/syncthing-*.desktop


# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Do not wait on network during boot
systemctl disable NetworkManager-wait-online.service
