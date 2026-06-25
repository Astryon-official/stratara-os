# Stratara Build VM Quickstart

Use this inside the Kubuntu build VM.

## 1. Clone The Repo

```bash
mkdir -p ~/stratara
cd ~/stratara
git clone https://github.com/Astryon-official/stratara-os.git
cd stratara-os
```

## 2. Prepare The VM

```bash
bash scripts/setup-cubic-build-vm.sh
```

This installs the tools needed for the first Cubic-based Stratara ISO workflow and creates local build folders.

## 3. Add The Kubuntu ISO

Download the Kubuntu 24.04 LTS ISO and place it here:

```text
~/stratara/iso/
```

Do not commit ISO files into Git.

## 4. Start Cubic

```bash
cubic
```

Use:

```text
Project directory: ~/stratara/cubic/stratara-os-0.1
Original ISO: ~/stratara/iso/<kubuntu-24.04-lts.iso>
Output filename: stratara-os-0.1-dev-test.iso
```

When Cubic opens the chroot terminal, follow:

```text
docs/Stratara-v0.1-remix-runbook.md
```

