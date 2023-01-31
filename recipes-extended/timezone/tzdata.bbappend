do_install:append() {
	ln -sf ${datadir}/zoneinfo/Europe/Berlin ${D}${sysconfdir}/localtime
}
