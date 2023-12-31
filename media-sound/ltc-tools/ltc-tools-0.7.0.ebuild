# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

[[ "${PV}" = "9999" ]] && inherit git-r3

inherit toolchain-funcs

if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="git://github.com/x42/${PN}.git"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="http://github.com/x42/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RESTRICT="mirror"

DESCRIPTION="Linear/Logitudinal Time Code (LTC) Library tools"
HOMEPAGE="https://github.com/x42/ltc-tools"
LICENSE="GPL-2"
SLOT="0"

RDEPEND=">=media-libs/libltc-1.1.0
	media-libs/libsndfile
	virtual/jack"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_compile() {
	tc-export CC
	default
}

src_install() {
	export PREFIX="${EPREFIX}"/usr
	default
}
