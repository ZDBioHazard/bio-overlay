# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# I Originally swiped this from someone else's overlay, but I
# basically totally rewrote it to add useflags and proper deps.
EAPI="2"
inherit cmake-utils eutils versionator linux-info

MY_PN="${PN/plugins/plug-ins}"
MY_PV=$(replace_version_separator 3 '-')
MM_PV=$(get_version_component_range '1-2')
MMD_PV=$(get_version_component_range '1-3')

DESCRIPTION="Official plugins for cairo-dock"
HOMEPAGE="https://launchpad.net/cairo-dock-plug-ins/"
SRC_URI="http://launchpad.net/${MY_PN}/${MM_PV}/${MMD_PV}/+download/${PN}-${MY_PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa ical compiz gnome kde xklavier xrandr exif terminal tomboy webkit
      xfce xgamma networkmanager experimental"

RDEPEND="
	dev-libs/dbus-glib
	dev-libs/glib:2
	dev-libs/libxml2
	gnome-base/librsvg
	sys-apps/dbus
	x11-libs/cairo
	x11-libs/gtk+:2
	x11-libs/gtkglext
	~x11-misc/cairo-dock-${PV}

	alsa? ( media-libs/alsa-lib )
	ical? ( dev-libs/libical )
	compiz? ( x11-wm/compiz )
	gnome? (
		gnome-base/gnome-menus
		gnome-base/gvfs
	)
	kde? ( kde-base/kdelibs )
	xklavier? ( x11-libs/libxklavier )
	xrandr? ( x11-apps/xrandr )
	exif? ( media-libs/libexif )
	terminal? ( x11-libs/vte )
	tomboy? ( app-misc/tomboy )
	webkit? ( >=net-libs/webkit-gtk-1.0 )
	networkmanager? ( net-misc/networkmanager )
	xfce? ( xfce-base/thunar )
	xgamma? ( x11-libs/libXxf86vm )
	experimental? (
		dev-libs/libdbusmenu
		sys-apps/mlocate
	)"

DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	dev-util/pkgconfig
"

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-enable_useflags.patch"
}

# Additional config options
src_configure() {
	local mycmakeargs=(
		# This requires packages not in portage.
		-DNO_INDICATOR=ON
		# This stuff is bizarre and funky. Always disable it.
		-DNO_MAIL=ON
		-DNO_MEMENU=ON
		-DNO_MESSAGING_MENU=ON
	)

	# Warn about missing kernel options.
	if ! linux_config_exists; then
		ewarn "Couldn't find your kernel .config, so Power Manager won't be built."
		mycmakeargs+=( -DNO_POWERMANAGER=ON )
	else
		if ! linux_chkconfig_present ACPI_PROCFS_POWER; then
			ewarn "Power Manager requires CONFIG_ACPI_PROCFS_POWER to be set in your kernel."
			ewarn "Power Manager will not be built."
			mycmakeargs+=( -DNO_POWERMANAGER=ON )
		fi
	fi

	# Warn about experimental plugins.
	if use experimental; then
		ewarn "Warning: You are enabling experimental plugins!"
		ewarn "Doncky, Network Monitor, Scooby-Do, Status Notifier and Remote Control"
		ewarn "are still experimental. Don't expect them to work right."
		mycmakeargs+=(
			$(cmake-utils_use_enable experimental DONCKY)
			$(cmake-utils_use_enable experimental SCOOBY_DO)
			$(cmake-utils_use_enable experimental STATUS_NOTIFIER)
			$(cmake-utils_use_enable experimental REMOTE_CONTROL)
			$(cmake-utils_use_enable networkmanager NETWORK_MONITOR)
		)
	fi

	# Do the rest of the plugins based on their useflags.
	mycmakeargs+=(
		$(cmake-utils_use_no alsa ALSA)
		$(cmake-utils_use_no ical CLOCK)
		$(cmake-utils_use_no compiz COMPIZ)
		$(cmake-utils_use_no gnome GMENU)
		$(cmake-utils_use_no gnome GNOME)
		$(cmake-utils_use_no gnome GVFS)
		$(cmake-utils_use_no kde KDE)
		$(cmake-utils_use_no xklavier KEYBOARD_INDICATOR)
		$(cmake-utils_use_no xrandr SHOW_DESKTOP)
		$(cmake-utils_use_no exif SLIDER)
		$(cmake-utils_use_no terminal TERMINAL)
		$(cmake-utils_use_no tomboy TOMBOY)
		$(cmake-utils_use_no webkit WEBLETS)
		$(cmake-utils_use_no networkmanager WIFI)
		$(cmake-utils_use_no xfce XFCE)
		$(cmake-utils_use_no xgamma XGAMMA)
	)

	# Finally we can configure this thing. >.>
	cmake-utils_src_configure
}

