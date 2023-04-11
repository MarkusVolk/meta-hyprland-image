do_install:append() {
	echo "LANG=en_US.UTF-8" >> ${D}${sysconfdir}/environment
	echo "LC_ALL=en_US.UTF-8" >> ${D}${sysconfdir}/environment
	echo "SHELL=/bin/bash" >> ${D}${sysconfdir}/environment
	echo "SDL_VIDEODRIVER=wayland" >> ${D}${sysconfdir}/environment
	echo "XDG_CONFIG_DIRS=/etc/xdg/" >> ${D}${sysconfdir}/environment
	echo "XDG_DATA_DIRS=/usr/share" >> ${D}${sysconfdir}/environment
	echo "XDG_RUNTIME_DIR=/run/user/1000" >> ${D}${sysconfdir}/environment
	echo "XDG_SESSION_CLASS=user" >> ${D}${sysconfdir}/environment
	echo "XDG_SESSION_TYPE=wayland" >> ${D}${sysconfdir}/environment
	echo "XKB_DEFAULT_LAYOUT=en" >> ${D}${sysconfdir}/environment
	echo "QT_STYLE_OVERRIDE=adwaita-dark" >> ${D}${sysconfdir}/environment
}
