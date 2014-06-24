#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

#if [ "${root%%:*}" = "fsimg" ] ; then
if [ -n "$fspart" ]; then
    modprobe ntfs
    fspart=$(getarg rd.fspart)
    wait_for_dev $fspart
    #rootok=1
fi
