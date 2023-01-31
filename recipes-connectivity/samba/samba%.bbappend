FILESEXTRAPATHS:prepend := "${THISDIR}/samba:"

RDEPENDS:${PN} += "glibc-gconv-ibm850"

inherit main-user-base

SRC_URI:append = " \
    file://samba \
    file://smb.conf \
"

do_install:append() {
    install -d ${D}${sysconfdir}/pam.d
    install -m 0644 ${WORKDIR}/samba ${D}${sysconfdir}/pam.d
    install -m 0644 ${WORKDIR}/smb.conf ${D}${sysconfdir}/samba
    sed -i "s|@user@|${MAIN_USER_NAME}|" ${D}${sysconfdir}/samba/smb.conf
    sed -i "s|@path@|${MAIN_USER_HOMEDIR}/Public|" ${D}${sysconfdir}/samba/smb.conf
    sed -i "s|/var/run|/run|" ${D}/etc/tmpfiles.d/samba.conf
}

# The services get started on demand. Avoid to start with system
SYSTEMD_AUTO_ENABLE:${PN}-base = "disable"

# Add the main user to the Samba database if it does not already exist. Potentially unsafe, doesn't work with encrypted passwords
pkg_postinst_ontarget:${PN}() {
    pdbedit -L | grep ${MAIN_USER_NAME} > /dev/null 2>&1 || (echo ${MAIN_USER_PASSWORD}; echo ${MAIN_USER_PASSWORD}) | smbpasswd -s -a  ${MAIN_USER_NAME} > /dev/null 2>&1
}
