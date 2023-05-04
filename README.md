# meta-hyprland-image

This layer adds configuration to build a basic desktop image based on hyprland.
It aims to support the basic features and includes only some useful tools but can
be expanded by flatpak/gnome-software.

This is to give hyperland, which is compelling work, a platform. It may be used as a
template to create custom hyprland based images.

Flatpaks have been tested to install and run (chromium, mpv, obs-studio)

![Screenshot](https://github.com/MarkusVolk/meta-hyprland-image/blob/master/Screenshot.jpg?raw=true)

To have hardware accelerated video decode available you need to allow commercial licenses in local.conf.

```
  LICENSE_FLAGS_ACCEPTED = "commercial"
```
By default the following users are added:

```
  username: user
  password: user

  username: root
  password: root
```

Those can be overriden by setting your desired user and passwords in local.conf.

 ```
  MAIN_USER_NAME = "wanted_username"
```

Set your passwords like this:

```
  MAIN_USER_PASSWORD = "wanted_userpassword"
  ROOT_PASSWORD = "wanted_root_password"
```

Or like this, if you dont want to store the passwords in cleartext on your build machine:

```
  MAIN_USER_PASSWORD_ENCRYPTED = "$5$XY6c2wTzYrJj430c$411GyOGTQf5x3LyFsdfr4/i5svsXmuYtXM9.vF2W/T7"
  ROOT_PASSWORD_ENCRYPTED = "$5$BFYZdQvvqXQnHqf8$nqTwze0fcLsRwdC4D3UmuHQyV7Wgf4mWiXlOTxqfCyC"
```

Currently it depends on the following layers:

```
  meta
  meta-kodi
  meta-poky
  meta-yocto-bsp
  meta-openembedded/meta-oe
  meta-openembedded/meta-multimedia
  meta-openembedded/meta-networking
  meta-openembedded/meta-gnome
  meta-openembedded/meta-python
  meta-openembedded/meta-filesystems
  meta-openembedded/meta-xfce
  meta-security/meta-tpm
  meta-wayland
  meta-image
  meta-hyprland-image
  meta-qt6
```

Depending on your machine eventually additional machine specific layers are reuqired.
In my case also this was included:


```
  meta-intel
```
