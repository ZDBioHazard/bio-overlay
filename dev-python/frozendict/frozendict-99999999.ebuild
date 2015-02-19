# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1 git-2

DESCRIPTION="An immutable wrapper around dictionaries"
HOMEPAGE="https://github.com/slezica/python-frozendict"
EGIT_REPO_URI="https://github.com/slezica/python-${PN}.git"
KEYWORDS="~amd64 ~x86 ~arm"
LICENSE="Apache"
SLOT="0"
