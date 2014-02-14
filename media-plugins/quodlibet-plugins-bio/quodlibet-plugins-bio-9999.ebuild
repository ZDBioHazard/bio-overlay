# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_7 )
inherit python-r1 git-2

DESCRIPTION="ZDBioHazard's Plugins for Quod Libet"
HOMEPAGE="https://github.com/ZDBioHazard/quodlibet-plugins-bio/"
EGIT_REPO_URI="https://github.com/ZDBioHazard/quodlibet-plugins-bio.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-sound/quodlibet-3.0.0"

src_install() {
	insinto "$(python_get_sitedir)"/quodlibet/plugins
	doins -r songsmenu playorder # No 'events' or 'editing' plugins yet.
}

src_install() {
	dodoc README.md

	# Get rid of things we don't want to install.
	rm -rf README.md .gitignore .git/ patches/ || \
		die "Couldn't remove useless files. D:"

	local python_moduleroot=quodlibet/plugins
	python_foreach_impl python_domodule .
}
