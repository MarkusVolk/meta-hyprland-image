SUMMARY = "This provides screenshot/screencast xdg-desktop-portal backends for hyprland."
HOMEPAGE = "https://github.com/hyprwm/xdg-desktop-portal-hyprland"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e316e9609dd7672b87ff25b46b2cf3e1"

# Note: meta-qt6 is needed
DEPENDS = " \
    wayland \
    wayland-native \
    wayland-protocols \
    libdrm \
    libinih \
    util-linux \
    pipewire \
    virtual/libgbm \
"

RDEPENDS:${PN} = "hyprland-share-picker"
RCONFLICTS:${PN} = "xdg-desktop-portal-wlr"

inherit meson pkgconfig features_check
REQUIRED_DISTRO_FEATURES = "opengl wayland"

SRC_URI = "gitsm://github.com/hyprwm/xdg-desktop-portal-hyprland.git;protocol=https;nobranch=1"

S = "${WORKDIR}/git"
SRCREV = "198d019583e332653d4e8dcca9439817b39b6a20"
PV = "0.2.1"

PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'basu', d)}"

PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsd-bus-provider=libsystemd,-Dsystemd=disabled,systemd"
PACKAGECONFIG[basu] = "-Dsd-bus-provider=basu,,basu"

FILES:${PN} += "${systemd_user_unitdir} ${datadir}"
