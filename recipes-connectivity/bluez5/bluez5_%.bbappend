PACKAGECONFIG:append = " midi sixaxis threads"

do_install:append() {
    cat >${D}${sysconfdir}/bluetooth/main.conf <<EOF
[General]
DiscoverableTimeout = 60

[Policy]
AutoEnable=true
EOF
}
