# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="5"
inherit eutils

DESCRIPTION="Charles is an HTTP proxy / HTTP monitor / Reverse Proxy that enables a developer to view all of the HTTP and SSL / HTTPS traffic between their machine and the Internet"
HOMEPAGE="https://www.charlesproxy.com/"
SRC_URI="https://www.charlesproxy.com/assets/release/${PV}/${P}.tar.gz"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RESTRICT="strip"

RDEPEND=">=virtual/jdk-1.6"

S="${WORKDIR}/charles"

src_install() {
    local dir="/opt/${P}"
    insinto "${dir}"
    doins -r *
    fperms 755 "${dir}/bin/charles"
    local icon=${PN}
    newicon "icon/charles_icon.svg" ${icon}.png
    dodir /usr/bin
    make_wrapper "${PN}" "/opt/${P}/bin/charles"
    make_desktop_entry ${PN} "Charles Proxy ${PV}" ${icon} "Network"
}
