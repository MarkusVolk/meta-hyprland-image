MAIN_USER_ID ?= "1000"
MAIN_USER_GROUPS ?= "audio,dialout,disk,i2c,input,netdev,plugdev,shutdown,sudo,tty,users,video,wheel,lpadmin,lp"
MAIN_USER_NAME ??= "user"
MAIN_USER_PASSWORD ??= "user"
MAIN_USER_PASSWORD_ENCRYPTED ??= "$(openssl passwd -5 ${MAIN_USER_PASSWORD})"

ROOT_PASSWORD ??= "root"
ROOT_PASSWORD_ENCRYPTED ??= "$(openssl passwd -5 ${ROOT_PASSWORD})"

MAIN_USER_HOMEDIR ?= "/home/${MAIN_USER_NAME}"

MAIN_USER_DEFAULT_TARGET_WANTS ?= "${MAIN_USER_HOMEDIR}/.config/systemd/user/default.target.wants"
MAIN_USER_SOCKETS_TARGET_WANTS ?= "${MAIN_USER_HOMEDIR}/.config/systemd/user/sockets.target.wants"
