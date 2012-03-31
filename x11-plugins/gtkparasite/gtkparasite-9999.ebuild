# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="2"
inherit autotools git-2

DESCRIPTION="Attaches to GTK+ applications and shows widget heiarchy."
HOMEPAGE="https://chipx86.github.com/gtkparasite/"
EGIT_REPO_URI="
	  git://github.com/chipx86/gtkparasite.git
	https://github.com/chipx86/gtkparasite.git"

LICENSE="MIT"
SLOT="0"

KEYWORDS=""
IUSE=""
RDEPEND=""

src_prepare() {
	eautoreconf || die "Autoconf failed! D:"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed! D:"
}

