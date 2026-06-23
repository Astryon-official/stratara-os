# Stratara OS v0.1 Remix Runbook

Project: Stratara OS  
Organization: Astryon  
Owner: Heath  
Base: Kubuntu 24.04 LTS  
Desktop: KDE Plasma  
Installer: Calamares  
Build approach: Cubic first, automation later

## Goal

Build the first bootable Stratara OS ISO without touching the damaged `craftcoveserver` build environment.

This first ISO is a branded Kubuntu remix. The goal is not perfection. The goal is a real ISO that boots, installs, and looks like Stratara.

## Phase 1: Fresh Build VM

Create a new disposable VM called:

```text
stratara-build-vm
```

Recommended VM settings:

```text
OS: Kubuntu 24.04 LTS or Ubuntu 24.04 LTS
CPU: 4 cores
RAM: 8 GB minimum, 12-16 GB preferred
Disk: 80 GB minimum
Network: enabled
Snapshots: enabled
```

After install, update the VM:

```bash
sudo apt update
sudo apt full-upgrade -y
sudo reboot
```

Create a snapshot named:

```text
clean-build-vm
```

## Phase 2: Install ISO Customizer

Use Cubic for the first Stratara ISO.

```bash
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:cubic-wizard/release
sudo apt update
sudo apt install -y cubic
```

If Cubic is unavailable, stop here and use a fresh VM with a supported Cubic install path.

## Phase 3: Download Kubuntu ISO

Download the official Kubuntu 24.04 LTS ISO in the VM.

Recommended folder:

```bash
mkdir -p ~/stratara/iso ~/stratara/cubic ~/stratara/output
```

Put the downloaded Kubuntu ISO in:

```text
~/stratara/iso/
```

## Phase 4: Open Kubuntu ISO In Cubic

Start Cubic:

```bash
cubic
```

Use:

```text
Project directory: ~/stratara/cubic/stratara-os-0.1
Original ISO: the Kubuntu 24.04 LTS ISO
Custom ISO name: stratara-os-0.1.iso
```

When Cubic opens the terminal inside the ISO filesystem, continue with the branding steps.

## Phase 5: Basic System Branding

Inside Cubic's chroot terminal, inspect the current files first:

```bash
cat /etc/os-release
cat /etc/lsb-release
hostname
```

Set a first-pass Stratara identity:

```bash
cat >/etc/os-release <<'EOF'
PRETTY_NAME="Stratara OS 0.1"
NAME="Stratara OS"
VERSION_ID="0.1"
VERSION="0.1 (Noble Preview)"
VERSION_CODENAME=noble
ID=stratara
ID_LIKE="ubuntu debian"
HOME_URL="https://astryon.com"
SUPPORT_URL="https://astryon.com"
BUG_REPORT_URL="https://github.com/Astryon"
PRIVACY_POLICY_URL="https://astryon.com"
UBUNTU_CODENAME=noble
EOF
```

Create or update:

```bash
cat >/etc/lsb-release <<'EOF'
DISTRIB_ID=Stratara
DISTRIB_RELEASE=0.1
DISTRIB_CODENAME=noble
DISTRIB_DESCRIPTION="Stratara OS 0.1"
EOF
```

Set hostname default:

```bash
echo stratara > /etc/hostname
```

## Phase 6: Package Direction

For the first ISO, keep the Kubuntu package set mostly intact.

Do not remove core KDE, installer, networking, drivers, or firmware yet.

Good early additions:

```bash
apt update
apt install -y neofetch curl wget git gparted kde-config-sddm plasma-workspace-wallpapers
```

Avoid heavy changes until the ISO boots and installs successfully.

## Phase 7: Branding Targets

These are the first areas to customize:

```text
/usr/share/wallpapers/stratara/
/usr/share/sddm/themes/
/usr/share/plymouth/themes/
/etc/calamares/
/usr/share/calamares/branding/
/etc/skel/
```

The `work/stratara-remix-kit` folder in this Codex workspace is where we will prepare these files before copying them into the VM.

## Phase 8: Calamares Branding

Find the current Calamares branding folder:

```bash
find /usr/share/calamares -maxdepth 3 -type f | sort
find /etc/calamares -maxdepth 3 -type f | sort
```

The key files are usually:

```text
/etc/calamares/settings.conf
/usr/share/calamares/branding/<branding-name>/branding.desc
```

For v0.1, copy the existing Kubuntu branding folder and rename it:

```bash
mkdir -p /usr/share/calamares/branding/stratara
cp -a /usr/share/calamares/branding/*/. /usr/share/calamares/branding/stratara/ 2>/dev/null || true
```

Then update `settings.conf` so the branding entry points to:

```text
stratara
```

## Phase 9: Export ISO

In Cubic:

1. Continue through the package cleanup screen.
2. Keep default kernel and boot settings for v0.1.
3. Generate the ISO.
4. Save it as:

```text
stratara-os-0.1.iso
```

## Phase 10: Test VM

Create a second VM:

```text
stratara-test-vm
```

Recommended settings:

```text
CPU: 2-4 cores
RAM: 4-8 GB
Disk: 40 GB
Boot ISO: stratara-os-0.1.iso
```

Test checklist:

```text
[ ] ISO boots to live desktop
[ ] Branding appears somewhere visible
[ ] Network works
[ ] Calamares opens
[ ] Installer completes
[ ] Installed system boots
[ ] User account works
[ ] KDE session loads
[ ] Shutdown/reboot works
```

## Stop Conditions

Stop and fix before moving forward if:

```text
- ISO does not boot
- Live session has no desktop
- Calamares crashes
- Installed system does not boot
- Networking is broken
- Login manager is broken
```

## After v0.1 Boots

Next work:

```text
1. Create real Stratara wallpaper
2. Create SDDM theme
3. Create Plymouth boot theme
4. Create Calamares slides and branding
5. Create Welcome app
6. Package branding as stratara-default-settings
7. Automate ISO rebuilds
```

