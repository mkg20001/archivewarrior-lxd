# archivewarrior-lxd

Generates an LXD image containing the archivewarrior VM

# Usage

Run `./make-lxd.sh`

Note that you'll need the following installed: lxd, qemu, envsubst

For nixos users: Run `./make-lxd-nix.sh`

The image will be available as `archivewarrior`

For sharing run `lxc image export archivewarrior` and distribute the resulting files
