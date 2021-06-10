# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils flag-o-matic

DESCRIPTION="Cloud music integration for your desktop"
HOMEPAGE="https://colinduquesnoy.gitlab.io/MellowPlayer/"
SRC_URI="https://gitlab.com/ColinDuquesnoy/MellowPlayer/-/archive/${PV}/MellowPlayer-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=">=dev-qt/qtcore-5.9.0
	dev-qt/qtwebengine[widgets]
	dev-qt/qtquickcontrols2
	dev-qt/qtquickcontrols
	dev-qt/qtdbus
	dev-qt/qtconcurrent
	dev-qt/qtsql
	dev-qt/qtsvg
	x11-libs/libnotify"
DEPEND="${RDEPEND}
	>=dev-util/cmake-3.10
	dev-qt/linguist-tools"
BDEPEND=""

MY_PN="MellowPlayer"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

CMAKE_MAKEFILE_GENERATOR=emake

src_configure() {
	if ! test-flags-CXX -std=c++17; then
		die 'You need a C++17 compatible compiler in order to build ${MY_PN}'
	fi

	local mycmakeargs=(
		$( use test && echo '-DBUILD_TESTS=on' )
		-DCMAKE_BUILD_TYPE=Release
	)
	cmake-utils_src_configure
}

inherit virtualx

src_test() {
	virtx default
}

