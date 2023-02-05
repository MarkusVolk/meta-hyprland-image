do_install:append() {
    install -d ${D}${systemd_user_unitdir}/default.target.wants
    ln -fs ${systemd_user_unitdir}/gnome-keyring-daemon.service ${D}${systemd_user_unitdir}/default.target.wants
}

