FILESEXTRAPATHS:prepend := "${THISDIR}/kodi:"

SRC_URI:append = " \
	file://0001-kodi-hide-window-decoration.patch \
	file://0001-kodi-adjust-default-settings.patch \
"
SRC_URI:append:arm = " file://enable-drmprime.patch"
SRC_URI:append:aarch64 = " file://enable-drmprime.patch"

PACKAGECONFIG:append = " \
	dvdcss \
	optical \
	samba \
	vorbis \
	mariadb \
"

KODIGRAPHICALBACKEND = "wayland"
KODISYSTEMDAUTOSTART = "disable"

KODI_PLUGINS_INSTALL ?= " \
	kodi-addon-inputstream-adaptive \
	kodi-addon-inputstream-ffmpegdirect \
	kodi-addon-inputstreamhelper \
	kodi-addon-inputstream-rtmp \
	kodi-addon-peripheral-joystick \
	kodi-addon-vfs-libarchive \
	kodi-addon-vfs-rar \
"
