RRECOMMENDS:${PN} += "alsa-utils"

do_install:append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'true', 'false', d)}; then
	install -d ${D}${systemd_user_unitdir}/sockets.target.wants ${D}${systemd_user_unitdir}/default.target.wants
        if ${@bb.utils.contains('DISTRO_FEATURES', 'pipewire', 'true', 'false', d)}; then
            ln -fs ${systemd_user_unitdir}/pipewire-pulse.service ${D}${systemd_user_unitdir}/default.target.wants
            ln -fs ${systemd_user_unitdir}/pipewire-pulse.socket ${D}${systemd_user_unitdir}/sockets.target.wants
            ln -fs ${systemd_user_unitdir}/pipewire.service ${D}${systemd_user_unitdir}/default.target.wants
            ln -fs ${systemd_user_unitdir}/pipewire.socket ${D}${systemd_user_unitdir}/sockets.target.wants
            if ${@bb.utils.contains('PIPEWIRE_SESSION_MANAGER', 'wireplumber', 'true', 'false', d)}; then
                ln -fs ${systemd_user_unitdir}/wireplumber.service ${D}${systemd_user_unitdir}/default.target.wants
            else
                ln -fs ${systemd_user_unitdir}/pipewire-media-session.service ${D}${systemd_user_unitdir}/default.target.wants
            fi
        else
            ln -fs ${systemd_user_unitdir}/pulseaudio.service ${D}${systemd_user_unitdir}/default.target.wants
            ln -fs ${systemd_user_unitdir}/pulseaudio.socket ${D}${systemd_user_unitdir}/sockets.target.wants
        fi
    fi
}

