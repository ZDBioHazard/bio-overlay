# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vim-plugin

DESCRIPTION="vim plugin: helpfully color indentation space"
HOMEPAGE="https://github.com/nathanaelkane/vim-indent-guides"
SRC_URI="https://github.com/nathanaelkane/vim-indent-guides/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="vim"
KEYWORDS="~amd64 ~x86 ~x64-macos"

S=${WORKDIR}/vim-${P}
