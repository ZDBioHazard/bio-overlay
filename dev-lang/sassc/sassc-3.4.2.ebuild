# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit autotools

DESCRIPTION="libsass command line driver"
HOMEPAGE="https://github.com/sass/sassc"
SRC_URI="https://github.com/sass/${PN}/archive/${PV}.zip"

LICENSE="MIT"
KEYWORDS="~x86 ~amd64 ~arm"
SLOT="0"
IUSE=""

RDEPEND="dev-libs/libsass"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
