# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils cmake-utils git-2 multilib-minimal

DESCRIPTION="Various ELF run-time hacks"
HOMEPAGE="https://github.com/nullkey/elfhacks/"
EGIT_REPO_URI="git://github.com/nullkey/${PN}.git"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS=""

DEPEND="dev-util/cmake"

multilib_src_configure() {
    local mycmakeargs=(
        -DMLIBDIR:PATH="$(get_libdir)"
    )
    cmake-utils_src_configure
}
