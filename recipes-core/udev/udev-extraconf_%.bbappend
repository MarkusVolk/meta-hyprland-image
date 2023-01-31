do_install() {
    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
    install -m 0644 ${WORKDIR}/localextra.rules    ${D}${sysconfdir}/udev/rules.d/localextra.rules
    install -d ${D}${sysconfdir}/udev/mount.ignorelist.d
    install -m 0644 ${WORKDIR}/mount.ignorelist     ${D}${sysconfdir}/udev/
    install -d ${D}${sysconfdir}/udev/scripts/
}
