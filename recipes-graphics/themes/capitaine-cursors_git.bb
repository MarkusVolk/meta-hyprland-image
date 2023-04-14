SUMMARY = "This is a cursor theme inspired by macOS and based on KDE Breeze."
LICENSE = "LGPL-3.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=90cffc6a4f1bcbb66067c81f5512c14f"


SRC_URI = "git://github.com/keeferrourke/capitaine-cursors.git;protocol=https;branch=master"

DEPENDS += "bc-native"

PV = "4"
SRCREV = "06c88433662a4004cf56a6e471b523a0a8880be0"
S = "${WORKDIR}/git"

inherit gtk-icon-cache

do_compile() {
	for type in light dark; do
		./build.sh --max-dpi xxxhd --type "$type"
	done
}

do_install() {
	install -d ${D}${datadir}/icons
	for type in light dark; do
		cp -dr --no-preserve=ownership dist/"$type" ${D}${datadir}/icons/capitaine-cursors-"$type"
	done
}

FILES:${PN} = "${datadir}"

