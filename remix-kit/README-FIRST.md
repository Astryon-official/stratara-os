# Start Here In The VM

The GitHub repo contains the files needed to prepare Stratara OS v0.1.

In the Kubuntu build VM:

```bash
mkdir -p ~/stratara
cd ~/stratara
git clone https://github.com/Astryon-official/stratara-os.git
cd stratara-os
bash scripts/setup-cubic-build-vm.sh
```

Then download the Kubuntu 24.04 LTS ISO into:

```text
~/stratara/iso/
```

Start Cubic:

```bash
bash scripts/open-cubic-project.sh
```

