# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Made this one myself. :)
EAPI="2"

DESCRIPTION="pidgin-autoresize resizes the buddy list vertically to fit the number of buddies shown"
HOMEPAGE="http://raoulito.info/plugins/pidgin_autoresize/"
SRC_URI="http://raoulito.info/plugins/pidgin_autoresize/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-im/pidgin"
DEPEND="${RDEPEND} dev-util/pkgconfig"

src_install() {
	make DESTDIR="${D}" install || die "Install failed! D:"
}

