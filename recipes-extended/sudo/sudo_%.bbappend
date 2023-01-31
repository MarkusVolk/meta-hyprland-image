do_install:append() {
	sed -i "s|# %wheel ALL=(ALL:ALL) ALL|%wheel ALL=(ALL:ALL) ALL|" ${D}${sysconfdir}/sudoers
}

