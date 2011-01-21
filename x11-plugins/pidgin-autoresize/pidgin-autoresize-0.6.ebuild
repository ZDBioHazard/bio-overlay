# Made this one myself. :)
EAPI="2"
inherit eutils

DESCRIPTION="pidgin-autoresize resizes the buddy list vertically to fit the number of buddies shown"
HOMEPAGE="http://raoulito.info/plugins/pidgin_autoresize/"
SRC_URI="http://raoulito.info/plugins/pidgin_autoresize/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-util/pkgconfig net-im/pidgin"

src_configure() {
	econf || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die
}

