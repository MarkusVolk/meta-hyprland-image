do_install:append() {
	echo "QT_WAYLAND_DISABLE_WINDOWDECORATION=1" >> ${D}${sysconfdir}/environment
}
