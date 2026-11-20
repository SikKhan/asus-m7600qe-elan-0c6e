# ELAN 04f3:0c6e investigation

## Scope

This work targets the ELAN fingerprint reader with USB ID `04f3:0c6e` in an
ASUS M7600QE running Ubuntu 26.04 (Resolute). The tested system used firmware
`0x0500`, kernel `7.0.0-27`, fprintd `1.94.5`, and Ubuntu libfprint
`1:1.95.1+tod1-0ubuntu1`.

Two separate problems were investigated:

1. Captures ended in `enroll-disconnected` after one or more successful stages.
2. The narrow reader has unreliable matching with libfprint's swipe assembler.

## Disconnect root causes

### USB runtime power management

The reader disconnected during capture when USB runtime suspend was enabled.
Keeping its `power/control` setting at `on` prevented this. The companion Debian
package installs a persistent udev rule matching USB vendor `04f3` and product
`0c6e`; it does not rely on a changeable USB device path.

### Device-specific finger-present response

The generic ELAN capture state accepts `0x55` as the finger-present response.
Firmware `0x0500` on this reader also returns `0xaf` while a finger is present.
Treating that response as an error aborts capture and is surfaced by fprintd as
`enroll-disconnected`.

The patch assigns `0c6e` a device-specific type and accepts `0xaf` only for that
type. The quirk is deliberately not applied to other ELAN devices, where the
same value may have a different meaning.

## Why the device remains a swipe reader

The physical sensing area is only `150x52` pixels. A direct stationary capture
produced a usable `150x50` image, but NBIS detected only three minutiae. The
ELAN image driver uses a Bozorth3 match threshold of 24.

Changing only the advertised scan type to `press` does not provide a usable
authentication path. Lowering the match threshold far enough for a
three-minutia image would create an unacceptable false-accept risk. The current
driver therefore assembles a larger image from frames collected during a
swipe.

A safe press implementation needs a partial-print matcher designed for narrow
sensors, plus false-accept and false-reject validation. The experimental
press-mode change was therefore excluded from the production patch.

Diagnostic captures are retained in `diagnostics/`:

- `finger-tap-direct.png`: one native stationary frame.
- `finger-tap.png`: stationary frames passed through the swipe assembler,
  showing repeated-ridge artifacts.
- `finger-tap-count.pgm`: native frame used for the minutiae measurement.

## Build and test record

The upstream source was built with only the ELAN driver enabled. These core
tests passed:

```text
unit-tests - libfprint:fpi-ssm     OK
unit-tests - libfprint:fpi-device  OK
```

Ubuntu's exact `1.95.1+tod1` source package was patched and rebuilt as
`1:1.95.1+tod1-0ubuntu1.1`. The same tests passed during the package build.

After installation, a new six-stage enrollment completed without a disconnect.
Verification completed normally rather than producing a protocol error or
disconnect. Match reliability remains around 40% and is sensitive to swipe
angle and speed; that is a separate image-assembly problem.

## Upstream submission

The focused upstream change is
`patches/0001-elan-accept-0xaf-finger-status-on-0c6e.patch`. It was developed as
commit `882b641` on a local libfprint branch. The package binaries, Ubuntu build
artifacts, diagnostics, and udev deployment package are supporting material and
are not intended to be included in a libfprint merge request.

Related libfprint issues:

- [#814](https://gitlab.freedesktop.org/libfprint/libfprint/-/work_items/814):
  `04f3:0c6e` response and image assembly.
- [#808](https://gitlab.freedesktop.org/libfprint/libfprint/-/work_items/808):
  protocol error during capture.
- [#759](https://gitlab.freedesktop.org/libfprint/libfprint/-/work_items/759):
  press/tap-mode request.
- [#401](https://gitlab.freedesktop.org/libfprint/libfprint/-/work_items/401):
  ELAN verification failures.
