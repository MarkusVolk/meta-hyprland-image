#!/bin/sh

flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak remote-add --if-not-exists --user gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
flatpak install --assumeyes --user org.gtk.Gtk3theme.adw-gtk3
flatpak install --assumeyes --user org.gtk.Gtk3theme.adw-gtk3-dark
