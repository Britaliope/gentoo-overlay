# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A faster implementation of i3lock-fancy."
HOMEPAGE="https://github.com/yvbbrjdr/i3lock-fancy-rapid"
SRC_URI="https://download1648.mediafire.com/d6ld8xwhybrg/qn454u3b1yqy04e/i3lock-fancy-rapid.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
>=x11-misc/i3lock-2.12
x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

src_install() {
	dobin i3lock-fancy-rapid
}
