# Calamares Branding Plan

For Stratara OS v0.1, start by copying the existing Kubuntu Calamares branding and changing only:

```text
- Product name
- Welcome text
- Slideshow images
- Accent color
- Installer window branding
```

Do not change partitioning, bootloader, locale, users, or package installation modules until the ISO installs successfully.

## Target Files

Likely paths inside the Cubic chroot:

```text
/etc/calamares/settings.conf
/usr/share/calamares/branding/stratara/branding.desc
/usr/share/calamares/branding/stratara/show.qml
/usr/share/calamares/branding/stratara/slide*.png
```

## First Welcome Copy

```text
Welcome to Stratara OS

A clean, modern Linux desktop from Astryon, built on Ubuntu LTS and KDE Plasma.
```

