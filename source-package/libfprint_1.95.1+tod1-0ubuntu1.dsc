-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: libfprint
Binary: libfprint-2-2, libfprint-2-dev, libfprint-2-doc, gir1.2-fprint-2.0, libfprint-2-tod1, libfprint-2-tod-dev, libfprint-2-tests
Architecture: any all
Version: 1:1.95.1+tod1-0ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Marco Trevisan <marco@ubuntu.com>
Homepage: https://www.freedesktop.org/wiki/Software/fprint/libfprint
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/ubuntu-dev-team/libfprint
Vcs-Git: https://salsa.debian.org/ubuntu-dev-team/libfprint.git -b ubuntu
Testsuite: autopkgtest
Testsuite-Triggers: gnome-desktop-testing
Build-Depends: debhelper-compat (= 13), dh-sequence-gir, gir1.2-gobject-2.0-dev, gir1.2-gio-2.0-dev, gobject-introspection, gtk-doc-tools, libcairo-dev <!nocheck>, libglib2.0-dev, libgudev-1.0-dev, libgusb-dev, libpixman-1-dev, libssl-dev, meson, python3 <!nocheck>, python3-cairo <!nocheck>, python3-gi <!nocheck>, systemd-dev, umockdev <!nocheck>
Build-Depends-Indep: libglib2.0-doc <!nodoc>, libgusb-doc <!nodoc>
Package-List:
 gir1.2-fprint-2.0 deb introspection optional arch=any
 libfprint-2-2 deb libs optional arch=any
 libfprint-2-dev deb libdevel optional arch=any
 libfprint-2-doc deb doc optional arch=all
 libfprint-2-tests deb libs optional arch=any
 libfprint-2-tod-dev deb libdevel optional arch=any
 libfprint-2-tod1 deb libs optional arch=any
Checksums-Sha1:
 1c13a67b0f0552192e775efcfac76973b9d62b7f 9551424 libfprint_1.95.1+tod1.orig.tar.bz2
 e3cef8630dff36235402a692957ee6c9f02e01f2 18164 libfprint_1.95.1+tod1-0ubuntu1.debian.tar.xz
Checksums-Sha256:
 b04c55ce1b1f0bcf97ca6e9e3dfbcad931ac2e8f87c29548c93d1aa69d9f6c60 9551424 libfprint_1.95.1+tod1.orig.tar.bz2
 9434514614ec45b562e2287075a0abc95bf15c2976908f30e249f36dd1835237 18164 libfprint_1.95.1+tod1-0ubuntu1.debian.tar.xz
Files:
 995ad540d0e7223c9b15544430719650 9551424 libfprint_1.95.1+tod1.orig.tar.bz2
 020e6460b2e1ebf23c65b985fb96164f 18164 libfprint_1.95.1+tod1-0ubuntu1.debian.tar.xz
Original-Maintainer: FingerForce Team <fingerforce-devel@lists.alioth.debian.org>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQ7A+KDJsVM+i7GajQPZQZq18FtsFAmmv7P0ACgkQQPZQZq18
Ftt3bw//bLLgtAvfSIMGXRycdqCixp3oGeEyokh2mpbyAxxc/CHtebjvFpPBS82i
rOzCN7CZKPzcqeLDTAkqxbZpIeYsxdI4SWcQ8oNT4noetRrTOc7HFgg9Cx1I9Ldk
pFej33Lel8rjMSQ2habAV6Ww2KuqH2JYm49M2ysXQkEZM+TYlJz/sa3QiWOrro/v
96otCffhxkwmQxDFvFzx7Xi3PSasbnpt8ddBL9O2yGnYxNB8OZiUTP4pZ5nO5t0g
dEfguH3TE+h/5R2ZWYXpBCMkSUui531SLq3eHEE23W2szD/fFKMH7++UG7Tgc1mn
zsWnOFO7h75vni8I5mie1olUinnDbB3NL32+9kLO7qUUBK7dyUIl7fJkUeIkKePX
5NE1dLEElkA8AsQEZKmswd7j19OYMxkbbof35M2y26qtUfeZ2VbMDJI6HvwCns4X
VWG2Y6kktdLr0Hdnv5oBEqlEqsBfOAXzBJTphm2UHHGDmliGzAPMGR2DH5yk33zu
Waf5yvKncOBGNDHKcH+RLyzoJ0cf1TtQpzmSIMtvmaqSbFygxS8v6D77qTauEtoQ
jAzYSawj2E83NU33UJ2tNhdAiWTVhaqXbAhUc3MM2fMu49ZxtKr++frgD0a+IJF/
NhmqrTKshlEjxAGJuCDnMfdhJVrRBynp3AlkZuMV8iKxgNZG9+o=
=Xi2R
-----END PGP SIGNATURE-----
