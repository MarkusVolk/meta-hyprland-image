do_install:append() {
	echo "QT_WAYLAND_DISABLE_WINDOWDECORATION=1" >> ${D}${sysconfdir}/environment
	echo "GDK_SCALE=2" >> ${D}${sysconfdir}/environment
	echo "XCURSOR_SIZE=32" >> ${D}${sysconfdir}/environment
}
