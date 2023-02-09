inherit main-user

do_install:append() {
	install -d ${D}${MAIN_USER_HOMEDIR}
	touch ${D}${MAIN_USER_HOMEDIR}/.azotebg
	chown ${MAIN_USER_NAME}:${MAIN_USER_NAME} -R ${D}${MAIN_USER_HOMEDIR}
}

FILES:${PN}:append = " \
	${MAIN_USER_HOMEDIR} \
"
