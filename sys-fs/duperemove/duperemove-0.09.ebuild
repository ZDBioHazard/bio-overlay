# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils

SLOT="0"
DESCRIPTION="Btrfs out-of-band deduplication"
HOMEPAGE="https://github.com/markfasheh/duperemove/"
SRC_URI="https://github.com/markfasheh/duperemove/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"

# This package uses a really hokey home-brewed single makefile
# build system, so this ebuild may or may not work properly.
# ... Just so you know.

src_prepare() {
	epatch ${FILESDIR}/${PN}_custom-flags.patch
}

src_install() {
	# There are other binaries built, but I don't know
	# what they are and they don't seem to be needed for
	# duperemove to work, so we'll leave them out for now.
	dobin ${PN}
	doman ${PN}.8
}
