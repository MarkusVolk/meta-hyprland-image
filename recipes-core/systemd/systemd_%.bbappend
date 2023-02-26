FILESEXTRAPATHS:prepend := "${THISDIR}/systemd:"

inherit main-user-base

SRC_URI:append = "file://0001-getty.service.in-configuration-patch-for-autologin.patch"

do_install:append() {
	sed -i "s|@MAIN_USER@|${MAIN_USER_NAME}|" ${D}${systemd_system_unitdir}/getty@.service
	echo "L! /root - - - - /home/root" >> ${D}${sysconfdir}/tmpfiles.d/00-create-volatile.conf
	if ${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', 'true', 'false', d)}; then
		install -d ${D}${sysconfdir}/systemd/system/sysinit.target.wants/
		ln -sf ${systemd_system_unitdir}/systemd-time-wait-sync.service ${D}${sysconfdir}/systemd/system/sysinit.target.wants/systemd-time-wait-sync.service
	fi
}
