do_install:append() {
	rm -f ${D}${datadir}/applications/footclient.desktop
	rm -f ${D}${datadir}/applications/foot-server.desktop
}

