FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
	file://xwayland-hidpi.patch \
	file://xwayland-vsync.patch \
"

PACKAGECONFIG:append = " xinerama"
