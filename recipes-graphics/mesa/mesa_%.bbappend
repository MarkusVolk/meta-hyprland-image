PACKAGECONFIG:append:class-target = " vulkan-beta"
PACKAGECONFIG:append:rpi:class-target = " broadcom"
PACKAGECONFIG:append:aarch64:class-target = " panfrost"
PACKAGECONFIG:append:x86:class-target = " va gallium gallium-llvm r600 dri3"
PACKAGECONFIG:append:x86-64:class-target = " va gallium gallium-llvm r600 dri3"

EXTRA_OEMESON += " \
    ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', '-Dvideo-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc', '', d)} \
"
