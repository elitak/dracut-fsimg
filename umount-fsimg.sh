#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

if fspart=$(getarg rd.fspart=) ; then
    #notneeded?#umount /oldroot
    #XXX on ctrl-alt-del this runs twice? losetup prints failure
    losetup -d /dev/loop0
    umount /oldsys/run/initramfs/fspart
fi
