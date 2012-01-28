# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/quodlibet/quodlibet-2.3.92.ebuild,v 1.2 2012/01/18 11:29:23 ssuominen Exp $

EAPI=4

PYTHON_DEPEND="2:2.7"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils eutils

DESCRIPTION="audio library tagger, manager, and player for GTK+"
HOMEPAGE="http://code.google.com/p/quodlibet/"
SRC_URI="http://quodlibet.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="dbus ipod stream pulseaudio"

COMMON_DEPEND=">=dev-python/pygtk-2.12"
RDEPEND="${COMMON_DEPEND}
	dev-python/feedparser
	>=dev-python/gst-python-0.10.2:0.10
	media-libs/gst-plugins-good:0.10
	>=media-libs/mutagen-1.14
	media-plugins/gst-plugins-meta:0.10
	dbus? (
		app-misc/media-player-info
		dev-python/dbus-python
		)
	pulseaudio? ( media-plugins/gst-plugins-pulse:0.10 )
	stream? ( media-plugins/gst-plugins-soup:0.10 )
	ipod? ( media-libs/libgpod[python] )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool"
REQUIRED_USE="ipod? ( dbus )"

src_prepare() {
	# Apply ALL the patches! _o/
	epatch ${FILESDIR}/${P}_fix-plugin-loader.patch
	epatch ${FILESDIR}/${P}_fix-window-destroy.patch
	epatch ${FILESDIR}/${P}_rating-symbol-config.patch
	epatch ${FILESDIR}/${P}_playcontrols-table.patch

	# Set the default GStreamer sink to ALSA or PulseAudio.
	DEFAULT_SINK="alsasink"
	if use pulseaudio; then DEFAULT_SINK="pulsesink"; fi
	sed -i -e "/gst_pipeline/s:\"\":\"${DEFAULT_SINK}\":" ${PN}/config.py || die

	distutils_src_prepare
}

src_install() {
	distutils_src_install
	dodoc HACKING NEWS README
	doicon ${PN}/images/hicolor/64x64/apps/{exfalso,quodlibet}.png
}

