# ASUS M7600QE ELAN 04f3:0c6e libfprint fix

Native Ubuntu/Debian packages for the ELAN `04f3:0c6e` fingerprint reader on
Ubuntu 26.04 (Resolute), amd64.

The bundle contains:

- A version-matched Ubuntu libfprint protocol patch that accepts the reader's
  device-specific `0xaf` finger-present response.
- A companion package that installs and owns the udev runtime-power rule.
- Ubuntu packaging source, a standalone upstream patch, diagnostics, source
  package metadata, and rollback documentation.

## Install

Download and extract `asus-m7600qe-elan-0c6e-ubuntu-26.04-amd64.zip` from the
[GitHub release](https://github.com/SikKhan/asus-m7600qe-elan-0c6e/releases/latest),
then install the runtime packages from the extracted directory:

```sh
sudo apt install ./packages/runtime/*.deb
```

Using `apt` is intentional: it validates package relationships and records all
installed files in dpkg's database. The companion package reloads udev and
restarts fprintd when installed.

Confirm the installation:

```sh
dpkg-query -W -f='${Package} ${Version}\n' \
  libfprint-2-2 libfprint-2-tod1 libfprint-elan-0c6e-fix
cat /sys/bus/usb/devices/3-1/power/control
systemctl is-active fprintd
```

The USB path can change after reconnecting or rebooting; the packaged udev rule
matches the vendor and product IDs and does not depend on `3-1`.

## Compatibility and current behavior

- Distribution: Ubuntu 26.04 (Resolute)
- Architecture: amd64
- Base libfprint: `1:1.95.1+tod1-0ubuntu1`
- Patched libfprint: `1:1.95.1+tod1-0ubuntu1.1`
- Hardware: ELAN USB `04f3:0c6e`, tested firmware `0x0500`

Enrollment now completes without `enroll-disconnected`. Verification works but
remains sensitive to swipe angle and speed because libfprint assembles narrow
sensor frames into a larger print. The package deliberately does not lower the
fingerprint match threshold or mislabel the reader as a press device.

## Remove the companion rule

```sh
sudo apt remove libfprint-elan-0c6e-fix
```

To restore Ubuntu's official libfprint build as well:

```sh
sudo apt install --reinstall \
  libfprint-2-2=1:1.95.1+tod1-0ubuntu1 \
  libfprint-2-tod1=1:1.95.1+tod1-0ubuntu1
sudo systemctl restart fprintd
```

If Ubuntu has published a newer version, inspect `apt-cache policy
libfprint-2-2 libfprint-2-tod1` and install that official version instead.

## Layout

```text
packages/runtime/       installable runtime .deb files
packages/development/   development, test, and debug packages
packaging/              source for the companion udev package
source-package/         original Ubuntu source-package files and build records
patches/                standalone upstream patch
diagnostics/            captured tap/swipe images used during investigation
INVESTIGATION.md         root causes, tests, security reasoning, and upstream notes
```

Installable `.deb` and `.ddeb` packages are attached to the GitHub release rather
than stored in Git. The large, reproducible Ubuntu and upstream build trees are
also not versioned. See `INVESTIGATION.md` for the full investigation, test
record, security reasoning, and upstream submission notes.
