#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

type getarg >/dev/null 2>&1 || . /lib/dracut-lib.sh

fspart=$(getarg rd.fspart)
fsimg=$(getarg rd.fsimg)

prepare_fsimg() {
    local lodev mnt
    mnt=/run/initramfs/fspart
    mkdir -p $mnt
    mount -t auto -o rw $fspart $mnt
    lodev=$(losetup -f)
    losetup $lodev $mnt/$fsimg
    #ln -s $lodev /dev/root
    # HACK this is prly not the place nor the solution, but this file is needed
    # otherwise the shutdown hooks don't get run, at least with how my root fs
    # is currently configured.
    # ('touch' not in initramfs)
    echo > /run/initramfs/.need_shutdown
}

if [ -n "$fspart" -a -n "$fsimg" ]; then
    prepare_fsimg
fi
