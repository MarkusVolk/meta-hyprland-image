FILESEXTRAPATHS:prepend := "${THISDIR}/linux-yocto:"

SRC_URI:append = " \
    file://fs.cfg \
    file://gamepad.cfg \
    file://nfsd.cfg \
    file://wlan.cfg \
    file://i2c.cfg \
    file://touchpad.cfg \
    file://gfx.cfg \
"

