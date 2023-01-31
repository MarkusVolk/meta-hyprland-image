RRECOMMENDS:${PN} += " \
	thunar-archive-plugin \
	thunar-media-tags-plugin \
	thunar-shares-plugin \
"

do_install:append() {
	rm -f ${D}${datadir}/applications/thunar-bulk-rename.desktop
	rm -f ${D}${datadir}/applications/thunar-settings.desktop
}
