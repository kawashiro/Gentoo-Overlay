# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Powerfull Ruby and Rails IDE similar to IntelliJ IDEA"
HOMEPAGE="https://www.jetbrains.com/ruby/"
SRC_URI="https://download.jetbrains.com/ruby/RubyMine-${PV}.tar.gz"

LICENSE="RubyMine"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="strip"

RDEPEND=">=virtual/jdk-1.6"


src_install() {
	local dir="/opt/${PN}"
	insinto "${dir}"
	doins -r RubyMine-${PV}/*
	fperms 755 "${dir}/bin/${PN}.sh"
	fperms 755 "${dir}/bin/rinspect.sh"
	fperms 755 "${dir}"/bin/fsnotifier{,64,-arm}
	local icon=${PN}
	newicon "RubyMine-${PV}/bin/${PN}.png" ${icon}.png
	dodir /usr/bin
	make_wrapper "${PN}" "/opt/${PN}/bin/${PN}.sh"
	make_desktop_entry ${PN} "RubyMine ${PV}" ${icon} "Development;IDE"
}
