#!/bin/bash
# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo/src/catalyst/targets/livecd-stage1/livecd-stage1-chroot.sh,v 1.18 2005/07/05 21:53:41 wolf31o2 Exp $

. /tmp/chroot-functions.sh

check_portage_version
update_env_settings

setup_myfeatures
setup_myemergeopts

## setup the environment

export FEATURES="${clst_myfeatures}"
export CONFIG_PROTECT="-*"

## START BUILD
setup_portage

#turn off auto-use:
export USE_ORDER="env:pkg:conf:defaults"	
export USE="${clst_livecd_use}"

run_emerge "${clst_packages}"
