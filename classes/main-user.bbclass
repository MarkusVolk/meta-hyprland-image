RDEPENDS:${PN} = "bash"

inherit main-user-base useradd extrausers

GROUPADD_PARAM:${PN} = "i2c; netdev; wheel; lpadmin"

USERADD_PACKAGES = "${PN}"
USERADD_PARAM:${PN} = " \
    --create-home \
    --user-group \
    --groups ${MAIN_USER_GROUPS} \
    --uid ${MAIN_USER_ID} \
    --home-dir ${MAIN_USER_HOMEDIR} \
    --shell /bin/bash \
    ${MAIN_USER_NAME} \
"

EXTRA_USERS_PARAMS += "usermod -p '${ROOT_PASSWORD_ENCRYPTED}' root;"
EXTRA_USERS_PARAMS += "usermod -p '${MAIN_USER_PASSWORD_ENCRYPTED}' ${MAIN_USER_NAME};"
