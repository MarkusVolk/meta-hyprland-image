SUMMARY = "Nordic is a Gtk3.20+ theme created using the awesome Nord color pallete."
LICENSE = "GPL-3.0-only"
LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"


SRC_URI = "https://github.com/EliverLara/Nordic/releases/download/v${PV}/Nordic-darker.tar.xz"
SRC_URI[sha256sum] = "49115292bfa15aaa9aea661c7468b48918708a6940e4b8058ac46f3dbb81c626"

PV = "2.2.0"
S = "${WORKDIR}/Nordic-darker"


do_install() {
	install -d ${D}${datadir}/themes
	cp -r ${S} ${D}${datadir}/themes
}

FILES:${PN} = " ${datadir}"

