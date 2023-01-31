
PACKAGECONFIG:append = " samba fuse dnssd"

EXTRA_OEMESON += " \
    -Dnfs=true \
"

DEPENDS += "libusb1 libnfs gnome-keyring"
