#!/bin/sh

set -e

mlist_path=/etc/pacman.mirrorlist
mlist_link=/etc/pacman.d/mirrorlist

pacman_log=/var/log/pacman.log

unset do_update

if [ ! -e $mlist_path ]; then
  dbfreeze_at=$(grep -- '-Sy' $pacman_log | head -n1 | cut -d' ' -f1 | tr -d '[' | tr '-' '/')
  mirror="https://archive.archlinux.org/repos/$dbfreeze_at/\$repo/os/\$arch"
  cat <<EOF > $mlist_path
Server=$mirror
EOF
  cat $mlist_path
  do_update=1
fi

if ! [ "$(readlink -f $mlist_link)" = $mlist_path ]; then
  test ! -e $mlist_link || rm $mlist_link
  ln -sv $mlist_path $mlist_link
  do_update=1
fi

if [ $do_update ]; then
  pacman -Syyuu --noconfirm
fi
