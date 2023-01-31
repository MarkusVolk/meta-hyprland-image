PACKAGECONFIG:append:class-target = " cups iso-codes colord ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'ffmpeg', '', d)}"
