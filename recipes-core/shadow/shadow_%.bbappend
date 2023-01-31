do_install:append:class-target() {
	echo "auth       optional     pam_gnome_keyring.so" >> ${D}${sysconfdir}/pam.d/login
	echo "session    optional     pam_gnome_keyring.so auto_start" >> ${D}${sysconfdir}/pam.d/login
}

