# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils cmake-utils git-2 multilib-minimal

DESCRIPTION="Thread-safe ring buffer library"
HOMEPAGE="https://github.com/lano1106/glcs-packetstream"
EGIT_REPO_URI="https://github.com/lano1106/glcs-${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="dev-util/cmake"

multilib_src_configure() {
    local mycmakeargs=(
        -DMLIBDIR:PATH="$(get_libdir)"
    )
    cmake-utils_src_configure
}
