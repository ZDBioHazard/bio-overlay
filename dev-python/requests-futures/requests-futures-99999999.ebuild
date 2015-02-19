# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1 git-2

DESCRIPTION="Asynchronous Python HTTP Requests for Humans using Futures"
HOMEPAGE="https://github.com/ross/requests-futures"
EGIT_REPO_URI="https://github.com/ross/${PN}.git"
KEYWORDS="~amd64 ~x86 ~arm"
LICENSE="Apache"
SLOT="0"

RDEPEND="
	>=dev-python/requests-1.2.0
	>=dev-python/futures-2.1.3"
