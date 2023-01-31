SUMMARY = "Configuration script to export ~/Public"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

inherit main-user-base

SRC_URI = "file://exports"

S = "${WORKDIR}"

do_install() {
	install -d ${D}${sysconfdir}
	install -m 0644 exports ${D}${sysconfdir}
	sed -i "s|@path@|${MAIN_USER_HOMEDIR}/Public|" ${D}${sysconfdir}/exports
}

RDEPENDS:${PN} = "packagegroup-core-nfs-server"
