# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit autotools

DESCRIPTION="A C/C++ implementation of a Sass compiler"
HOMEPAGE="https://github.com/sass/libsass"
SRC_URI="https://github.com/sass/${PN}/archive/${PV}.zip"

LICENSE="MIT"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
