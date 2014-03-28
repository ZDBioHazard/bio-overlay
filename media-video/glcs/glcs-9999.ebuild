# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils cmake-utils git-2 multilib-minimal

DESCRIPTION="OpenGL & ALSA video capture tool"
HOMEPAGE="http://github.com/lano1106/glcs/"
EGIT_REPO_URI="git://github.com/lano1106/${PN}.git"
EGIT_HAS_SUBMODULES="true"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="scripts"

DEPEND="
    >=dev-libs/packetstream-9999
    >=dev-libs/elfhacks-0.4.1
    virtual/opengl
    x11-libs/libX11
    x11-proto/xf86vidmodeproto
    media-libs/alsa-lib
    media-libs/libpng
    >=dev-util/cmake-2.6
"

multilib_src_configure() {
    local mycmakeargs=(
        -DLIBRARY_INSTALL_DIR="$(get_libdir)"
        -DCMAKE_LIBRARY_PATH="${PREFIX}/$(get_libdir)"
        -DBINARIES="$(is_final_abi && echo "ON" || echo "OFF")"
        $(cmake-utils_use scripts SCRIPTS)
    )
    cmake-utils_src_configure
}
