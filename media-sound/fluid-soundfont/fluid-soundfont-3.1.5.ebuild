# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit versionator

MY_PV=$(replace_version_separator 2 '-' ${PV})
DESCRIPTION="Standrad FluidSynth Soundfont. (GM and GS versions)"
HOMEPAGE="http://www.fluidsynth.org/"
SRC_URI="mirror://debian/pool/main/f/fluid-soundfont/${PN}-gm_${MY_PV}_all.deb
         mirror://debian/pool/main/f/fluid-soundfont/${PN}-gs_${MY_PV}_all.deb"

LICENSE="CC-BY"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="timidity"

src_unpack() {
	# Unpack the GM version.
	unpack ${PN}-gm_${MY_PV}_all.deb
	unpack ./data.tar.bz2
	unpack ${PN}-gs_${MY_PV}_all.deb
	unpack ./data.tar.bz2
}

src_install() {
	dodoc ./usr/share/doc/fluid-soundfont-gm/*

	insinto /usr/share/sounds/sf2/
	doins ./usr/share/sounds/sf2/FluidR3_GM.sf2
	doins ./usr/share/sounds/sf2/FluidR3_GS.sf2
	if use timidity; then
		insinto /etc/timidity/
		doins ./etc/timidity/fluidr3_gm.cfg
		doins ./etc/timidity/fluidr3_gs.cfg
	fi
}

