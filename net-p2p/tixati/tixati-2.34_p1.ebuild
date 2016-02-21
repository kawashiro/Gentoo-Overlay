# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="5"
inherit eutils

DESCRIPTION="Advanced and flexible BitTorrent client"
HOMEPAGE="http://www.tixati.com/"
WWWVER="tixati-2.34-1"
SRC_URI="
	x86? ( http://www.tixati.com/download/${WWWVER}.i686.manualinstall.tar.gz )
	amd64? ( http://www.tixati.com/download/${WWWVER}.x86_64.manualinstall.tar.gz )
"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RESTRICT="strip"

RDEPEND="
	>=x11-libs/gtk+-2:2
	>=x11-libs/gdk-pixbuf-2.0
"

S="${WORKDIR}/${WWWVER}.$(uname -m).manualinstall"

src_install() {
	exeinto /usr/bin
	doexe ${S}/tixati
	insinto /usr/share/icons/hicolor/48x48/apps
	doins ${S}/tixati.png
	insinto /usr/share/pixmaps
	doins ${S}/tixati.png
	insinto /usr/share/applications
	doins ${S}/tixati.desktop
}

