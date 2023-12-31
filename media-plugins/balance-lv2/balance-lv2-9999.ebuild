# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit git-r3 multilib

DESCRIPTION="Stereo balance control with optional per channel delay"
HOMEPAGE="http://github.com/x42/balance.lv2"
SRC_URI=""
EGIT_REPO_URI="https://github.com/x42/balance.lv2.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-libs/lv2
	media-libs/ftgl
	virtual/glu
	x11-libs/libX11
	media-fonts/freefont"
RDEPEND=""

DOCS=( README.md )

src_configure() {
	echo "Nothing to configure"
}

src_compile() {
	# you may change the font here
	emake FONTFILE="/usr/share/fonts/freefont/FreeSans.ttf"
}

src_install() {
	emake FONTFILE="/usr/share/fonts/freefont/FreeSans.ttf" DESTDIR="${D}" PREFIX="/usr" LIBDIR="$(get_libdir)" LV2DIR="/usr/$(get_libdir)/lv2" install
	dodoc "${DOCS}"
}
