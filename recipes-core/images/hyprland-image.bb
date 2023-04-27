DESCRIPTION = "Gnome image"
LICENSE = "BSD-2-Clause"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit core-image main-user

WWINDOW_MANAGER ?= "hyprland"
	
WGUI_APPS ?= " \
	azote \
	blueman \
	eog \
	evince \
	file-roller \
	gnome-calculator \
	gnome-disk-utility \
	gnome-keyring \	
	gnome-software \
	gnome-system-monitor \
	gnome-text-editor \
	gparted \
	gsettings-desktop-schemas \
	gvfs \
	gvfsd-trash \
	iwgtk \
	librsvg-gtk \
	mako \
	nwg-displays \
	nwg-launchers \
	nwg-look \
	pavucontrol \
	sirula \
	swappy \
	thunar \
	waybar \
	webp-pixbuf-loader \
"

WCONSOLE_TOOLS ?= " \
	bash \
	bzip2 \
	coreutils \
	coreutils-stdbuf \
	curl \
	dosfstools \
	e2fsprogs \
	findutils \
	flatpak \
	foot \
	gawk \
	git \
	grep \
	gzip \
	htop \
	imagemagick \
	iputils \
	less \
	libusb1 \
	light \
	nano \
	pamixer \
	playerctl \
	procps \
	psmisc \
	pv \
	rsync \
	sed \
	shadow \
	sudo \
	swaybg \
	tar \
	usbutils \
	util-linux \
	util-linux-agetty \
	util-linux-fstrim \
	which \
	wlr-randr \
	wob \
	xprop \
	xz \
"

WSYSTEM_CONF ?= " \
	ca-certificates \
	cups-filters \
	cups-pk-helper \
	exfatprogs \
	gtk4-printbackend-cups \
	gtk4-printbackend-file \
	libcanberra-pulse \
	linux-firmware \
	nfs-export-public \
	adw-gtk3 \
	packagegroup-fonts-truetype \
	resize-helper \
	shared-mime-info \
	shared-mime-info-data \
	sound-theme-freedesktop \
	steam-udev-rules \
	system-config \
	system-config-flathub \
	systemd-extra-utils \
	tela-circle-icon-theme \
	tzdata \
	tzdata-europe \
	udev-rules-udisks-hide-bootpart \
	wireless-regdb-static \
	xdg-user-dirs \
	xdg-desktop-portal \
	xfce-polkit \
	xkeyboard-config \
	xorg-minimal-fonts \
	xwayland \	
"

WSERVICES ?= " \
	autofs \
	avahi-utils \
	cifs-utils \
	cups \
	cups-lib \
	cups-libimage \
	fuse3 \
	fuse3-utils \
	geoclue \
	libavahi-libevent \
	libavahi-common \
	libavahi-core \
	libavahi-client \
	libavahi-glib \
	libavahi-gobject \
	nfs-utils \
	nfs-utils-client \
	pipewire \
	rpcbind \
	rtkit \
	samba \
	samba-base \
	upower \
"

WCOMMERCIAL ?= " \
	ffmpeg \
	wf-recorder \
"

WGLIBC ?= " \
	glibc-binary-localedata-cs-cz \
	glibc-binary-localedata-de-de \
	glibc-binary-localedata-en-us \
	glibc-binary-localedata-es-es \
	glibc-binary-localedata-fr-fr \
	glibc-binary-localedata-pl-pl \
	glibc-binary-localedata-ru-ru \
	glibc-charmap-utf-8 \
	localedef \
"

IMAGE_INSTALL += " \
	${WWINDOW_MANAGER} \
	${WGUI_APPS} \
	${WCONSOLE_TOOLS} \
	${WSYSTEM_CONF} \
	${WSERVICES} \
	${@bb.utils.contains('TCLIBC', 'glibc', '${WGLIBC}', '', d)} \
	${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', '${WCOMMERCIAL}', '', d)} \
"
