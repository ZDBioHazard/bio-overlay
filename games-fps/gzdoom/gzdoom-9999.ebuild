# I originally swiped this from someone's bug
# report, but I've chopped it to bits over time
EAPI="2"
inherit games cmake-utils subversion eutils

DESCRIPTION="Enhanced OpenGL port of the official DOOM source code that also supports Heretic, Hexen, and Strife"
HOMEPAGE="http://grafzahl.drdteam.org/"
ESVN_REPO_URI="http://mancubus.net/svn/hosted/gzdoom/trunk/"

LICENSE="DOOMLIC BUILDLIC BSD"
SLOT="0"

KEYWORDS=""
IUSE="mmx gtk"
DEPEND="
	mmx? ( || ( dev-lang/nasm dev-lang/yasm ) )
	gtk? ( x11-libs/gtk+:2 )
	media-libs/libsdl
	media-libs/fmod:1
	media-libs/flac
	media-libs/jpeg
	media-sound/fluidsynth
"
src_prepare() {
	# Use default game data path
	sed -i \
		-e "s:/usr/local/share/:${GAMES_DATADIR}/doom-data/:" \
		src/sdl/i_system.h || die
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_no mmx ASM)
		$(cmake-utils_use_no gtk GTK)
		-DFMOD_INCLUDE_DIR=/opt/fmodex/api/inc/
		-DFMOD_LIBRARY=/opt/fmodex/api/lib/libfmodex.so
	)

	cmake-utils_src_configure
}

src_install() {
	dodoc docs/*.{txt,TXT} || die
	dohtml docs/console*.{css,html} || die

	cd "${CMAKE_BUILD_DIR}" || die
	dogamesbin ${PN} || die

	insinto "${GAMES_DATADIR}/doom-data"
	doins ${PN}.pk3 || die

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "Copy or link wad files into ${GAMES_DATADIR}/doom-data/"
	elog "(the files must be readable by the 'games' group)."
	elog
	elog "To play, simply run: \"${PN}\" (and add options and stuff)"
}
