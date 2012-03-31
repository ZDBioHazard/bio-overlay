# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit python git-2
PYTHON_DEPEND="2:2.7"

DESCRIPTION="ZDBioHazard's Plugins for Quod Libet"
HOMEPAGE="https://github.com/ZDBioHazard/quodlibet-plugins-bio/"
EGIT_REPO_URI="
	  git://github.com/ZDBioHazard/quodlibet-plugins-bio.git
	https://github.com/ZDBioHazard/quodlibet-plugins-bio.git"

LICENSE="GPL-2"
SLOT="0"

KEYWORDS=""
IUSE=""
RDEPEND="media-sound/quodlibet"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_install() {
	insinto "$(python_get_sitedir)"/quodlibet/plugins
	doins -r songsmenu playorder # No 'events' or 'editing' plugins yet.
}

pkg_postinst() {
	python_mod_optimize quodlibet/plugins
}

pkg_postrm() {
	python_mod_cleanup quodlibet/plugins
}

