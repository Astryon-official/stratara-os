# Stratara OS

Stratara OS is Astryon's beginner-friendly, premium Linux desktop project.

The first development target is a Kubuntu 24.04 LTS based remix with KDE Plasma, Stratara branding, and Calamares installer customization.

## Current Track

The project has moved to a safer VM-based remix workflow:

1. Build from a fresh Kubuntu 24.04 ISO.
2. Customize the ISO with Cubic.
3. Keep the first release boringly reliable.
4. Add Stratara branding in layers.
5. Automate the build after the first ISO boots and installs cleanly.

## Key Files

- [Build VM quickstart](docs/vm-quickstart.md)
- [Stratara v0.1 remix runbook](docs/Stratara-v0.1-remix-runbook.md)
- [Remix kit staging folder](remix-kit/)

## Quick VM Setup

Inside the Kubuntu build VM:

```bash
mkdir -p ~/stratara
cd ~/stratara
git clone https://github.com/Astryon-official/stratara-os.git
cd stratara-os
bash scripts/setup-cubic-build-vm.sh
```

Then place the Kubuntu 24.04 LTS ISO in:

```text
~/stratara/iso/
```

Start Cubic with:

```bash
bash scripts/open-cubic-project.sh
```

## Early Release Targets

- Developer test ISO: Stratara OS 0.1 Dev Test
- Public tester ISO: Stratara OS 0.1 Alpha

These builds are not intended to be stable daily-driver releases yet.
