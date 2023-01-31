# Note: Dont add gtk PACKAGECONFIGs to avahi
# We can't set gtk and avahi dependent on each other
# (what we will do, if building cups support for gtk+3)
# without running in circles. Having cups enabled in
# gtk recipes is what we want for gnome shell

PACKAGECONFIG:append = " libevent libdns_sd"

PACKAGES += "libavahi-libevent"

FILES:libavahi-libevent += "  \
    /usr/lib/libavahi-libevent.so.1.0.0 \
    /usr/lib/libavahi-libevent.so.1 \
"
