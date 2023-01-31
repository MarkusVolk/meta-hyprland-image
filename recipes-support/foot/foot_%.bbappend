do_install:append() {
	rm -f ${D}${datadir}/applications/org.codeberg.dnkl.footclient.desktop
	rm -f ${D}${datadir}/applications/org.codeberg.dnkl.foot-server.desktop
}

