# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit autotools git-2

DESCRIPTION="Attaches to GTK+ applications and shows widget heiarchy."
HOMEPAGE="https://chipx86.github.com/gtkparasite/"
EGIT_REPO_URI="https://github.com/chipx86/gtkparasite.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	eautoreconf || die "Autoconf failed! D:"
}

