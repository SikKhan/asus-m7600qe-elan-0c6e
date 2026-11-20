# ELAN 04f3:0c6e status

Last updated: 2026-07-18

## Completed

- Investigated the ELAN `04f3:0c6e` reader in an ASUS M7600QE.
- Made USB runtime-power handling persistent with a packaged udev rule.
- Patched libfprint to accept device-specific finger-present response `0xaf`.
- Built Ubuntu 26.04 packages based on `1.95.1+tod1-0ubuntu1`.
- Installed patched version `1.95.1+tod1-0ubuntu1.1` locally.
- Confirmed six-stage enrollment completes without disconnecting.
- Created and validated an installable `.deb` bundle.
- Kept all source, packages, diagnostics, and documentation in this directory.

## Git

- Development branch: `fix/elan-0c6e-status` in the local upstream clone
- Protocol fix: `882b641`
- Documentation and udev rule: `5a7ff06`
- Standalone patch: `patches/0001-elan-accept-0xaf-finger-status-on-0c6e.patch`
- Upstream status: not pushed

## Install

```sh
cd /home/sikanderkhan/Projects/asus-m7600qe-elan-0c6e
sudo apt install ./packages/runtime/*.deb
```

## Current limitation

Verification works roughly 40% of the time and is sensitive to swipe angle and
speed. The hardware has a narrow `150x52` touch area, but a native tap produced
only 3 NBIS minutiae against libfprint's safe threshold of 24. A reliable fix
likely requires improved device-specific frame assembly or a partial-print
matcher; changing only the reported scan type is insufficient.

## Next possible work

- Capture successful and failed swipe traces.
- Compare frame movement, angle, and assembly errors.
- Tune a device-specific `0c6e` assembler without lowering match security.
- Push commit `882b641` upstream if desired later.

See `README.md` for package usage and `INVESTIGATION.md` for the complete
technical record.
