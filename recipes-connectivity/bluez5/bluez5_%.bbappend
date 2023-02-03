PACKAGECONFIG:append = " midi sixaxis threads"

EXTRA_OECONF += "--enable-experimental"

do_install:append() {
    cat >${D}${sysconfdir}/bluetooth/main.conf <<EOF
[General]
DiscoverableTimeout = 60

EOF
}
