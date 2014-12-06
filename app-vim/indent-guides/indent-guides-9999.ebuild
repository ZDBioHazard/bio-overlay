# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vim-plugin git-2

DESCRIPTION="vim plugin: helpfully color indentation space"
HOMEPAGE="https://github.com/nathanaelkane/vim-indent-guides"
EGIT_REPO_URI="https://github.com/nathanaelkane/vim-indent-guides.git"
LICENSE="vim"
KEYWORDS="~"

S=${WORKDIR}/vim-${P}
