FILESEXTRAPATHS:prepend := "${THISDIR}/iwd:"

SRC_URI:append = " file://main.conf"

PACKAGECONFIG:append = " wired"

do_install:append() {
	install -d ${D}${sysconfdir}/iwd
	install -m 644 ${WORKDIR}/main.conf ${D}${sysconfdir}/iwd
}
