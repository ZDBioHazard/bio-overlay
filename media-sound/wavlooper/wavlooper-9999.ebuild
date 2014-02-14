# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 git-2

DESCRIPTION="Chop and loop WAV files with an optional fadeout."
HOMEPAGE="https://github.com/ZDBioHazard/wavlooper/"
EGIT_REPO_URI="https://github.com/ZDBioHazard/wavlooper.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/docutils"

S=${WORKDIR}
