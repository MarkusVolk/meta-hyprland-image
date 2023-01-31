PACKAGES += "pulseaudio-user-service"
FILES:${PN}-user-service = "${MAIN_USER_DEFAULT_TARGET_WANTS} ${MAIN_USER_SOCKETS_TARGET_WANTS}"
RECOMMENDS:${PN}-server = "pulseaudio-user-service"
RRECOMMENDS:${PN} += "alsa-utils"

inherit main-user useradd

do_install:append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'true', 'false', d)}; then
        install -d ${D}${MAIN_USER_DEFAULT_TARGET_WANTS}
        install -d ${D}${MAIN_USER_SOCKETS_TARGET_WANTS}
        if ${@bb.utils.contains('DISTRO_FEATURES', 'pipewire', 'true', 'false', d)}; then
            ln -fs ${systemd_user_unitdir}/pipewire-pulse.service ${D}${MAIN_USER_DEFAULT_TARGET_WANTS}/pipewire-pulse.service
            ln -fs ${systemd_user_unitdir}/pipewire-pulse.socket ${D}${MAIN_USER_SOCKETS_TARGET_WANTS}/pipewire-pulse.socket
            ln -fs ${systemd_user_unitdir}/pipewire.service ${D}${MAIN_USER_DEFAULT_TARGET_WANTS}/pipewire.service
            ln -fs ${systemd_user_unitdir}/pipewire.socket ${D}${MAIN_USER_SOCKETS_TARGET_WANTS}/pipewire.socket
            if ${@bb.utils.contains('PIPEWIRE_SESSION_MANAGER', 'wireplumber', 'true', 'false', d)}; then
                ln -fs ${systemd_user_unitdir}/wireplumber.service ${D}${MAIN_USER_DEFAULT_TARGET_WANTS}/wireplumber.service
            else
                ln -fs ${systemd_user_unitdir}/pipewire-media-session.service ${D}${MAIN_USER_DEFAULT_TARGET_WANTS}/pipewire-media-session.service
            fi
        else
            ln -fs ${systemd_user_unitdir}/pulseaudio.service ${D}${MAIN_USER_DEFAULT_TARGET_WANTS}/pulseaudio.service
            ln -fs ${systemd_user_unitdir}/pulseaudio.socket ${D}${MAIN_USER_SOCKETS_TARGET_WANTS}/pulseaudio.socket
        fi
        chown ${MAIN_USER_NAME}:${MAIN_USER_NAME} -R ${D}${MAIN_USER_HOMEDIR}/
    fi
}

