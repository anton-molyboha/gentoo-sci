# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit perl-module perl-app

DESCRIPTION="convert whole CONSED dataset to a GAP4 project"
HOMEPAGE="http://genome.imb-jena.de/software/consed2gap/"
SRC_URI="http://genome.imb-jena.de/software/consed2gap/consed2gap.tgz"

LICENSE="FLI-Jena"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-lang/perl
		sci-libs/io_lib
		sci-biology/caftools
		sci-biology/align_to_scf"

MY_P="consed2gap"
S="${WORKDIR}/${MY_P}"

src_prepare(){
	sed -i 's#/usr/local/bin/perl#/usr/bin/env perl#' bin/phrap2caf || die
	sed -i 's#/usr/local/bin/perl#/usr/bin/env perl#' bin/badgerGetOpt.pl || die
}

src_install(){
	dobin bin/consed2gap bin/phrap2caf bin/badgerGetOpt.pl || die
	mkdir -p "${D}"/usr/share/"${PN}" || die
	cp -r example "${D}"/usr/share/"${PN}" || die

	cd bin && perl-module_src_install
}
