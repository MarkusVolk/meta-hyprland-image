do_install:append() {
	sed -i "s|/usr/bin/gparted|pkexec /usr/bin/gparted|" ${D}${datadir}/applications/gparted.desktop
}
