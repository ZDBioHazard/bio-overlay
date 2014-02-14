# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils

DESCRIPTION="A simple command-line image scaler that uses the hq2/3/4x algorithm."
HOMEPAGE="http://scale2x.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-libs/libpng-1.6"

src_prepare() {
	epatch ${FILESDIR}/${P}_libpng-1.4.patch
}

src_install() {
	make DESTDIR="${D}" install || die "Install failed! D:"
}

