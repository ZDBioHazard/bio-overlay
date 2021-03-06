# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{3,4,5} pypy3 )

inherit distutils-r1

DESCRIPTION="A utility to communicate with the ROM bootloader in Espressif ESP8266."
HOMEPAGE="https://github.com/espressif/esptool/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

RDEPEND=">=dev-python/pyserial-2.5l
         dev-python/pyaes
         dev-python/ecdsa"
