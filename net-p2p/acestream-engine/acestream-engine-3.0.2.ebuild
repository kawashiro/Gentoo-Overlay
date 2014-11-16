# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit multilib python-r1 unpacker

DESCRIPTION="ACE Stream Engine"
HOMEPAGE="http://torrentstream.org/"
SRC_URI=" x86? ( http://dl.acestream.org/debian/7/acestream_${PV}_debian_7.6_i686.tar.gz )
		amd64? ( http://dl.acestream.org/debian/7/acestream_${PV}_debian_7.4_x86_64.tar.gz )"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+gtk"

DEPEND="dev-python/m2crypto[${PYTHON_USEDEP}]
		dev-python/apsw[${PYTHON_USEDEP}]
		gtk? ( dev-libs/acestream-python-appindicator )"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

QA_PRESTRIPPED="usr/bin/acestreamengine
usr/share/acestream/lib/acestreamengine/Core.so
usr/share/acestream/lib/acestreamengine/node.so
usr/share/acestream/lib/acestreamengine/pycompat.so
usr/share/acestream/lib/acestreamengine/Transport.so
usr/share/acestream/lib/acestreamengine/CoreApp.so
usr/share/acestream/lib/acestreamengine/streamer.so"

src_install(){
	mkdir "${D}/usr/"
	mkdir "${D}/usr/bin/"
	mkdir "${D}/usr/share/"
	mkdir "${D}/usr/share/acestream/"

	[[ -d "acestream_${PV}_debian_7.6_i686" ]] && deb_dir="acestream_${PV}_debian_7.6_i686" || deb_dir="acestream_${PV}_debian_7.4_x86_64"

	cp -Rv "${deb_dir}/data" "${D}/usr/share/acestream/"
	cp -Rv "${deb_dir}/lib" "${D}/usr/share/acestream/"
	cp -v "${deb_dir}/acestream.conf" "${D}/usr/share/acestream/"
    cp -v "${deb_dir}/acestreamengine" "${D}/usr/bin/"
}
