#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

# called by dracut
check() {
    return 0
}

# called by dracut
depends() {
    return 0
}

# called by dracut
installkernel() {
    instmods ntfs
}

# called by dracut
install() {
    inst_hook cmdline 94 "$moddir/parse-fsimg.sh"
    inst_hook pre-mount 94 "$moddir/mount-fsimg.sh"
    inst_hook shutdown 94 "$moddir/umount-fsimg.sh"
}
