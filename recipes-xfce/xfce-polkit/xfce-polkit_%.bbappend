do_install:append() {
    rm -f ${D}${sysconfdir}/xdg/autostart/xfce-polkit.desktop
}
