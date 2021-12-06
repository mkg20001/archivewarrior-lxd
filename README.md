# archivewarrior-lxd

Generates an LXD image containing the archivewarrior VM

# Usage

Run `./build-lxd-warrior.sh`

This requires lxd and git to be installed

The image will be available as `archivewarrior`

For sharing run `lxc image export archivewarrior` and distribute the resulting files (can be imported with `lxc image import`)

To launch a warrior run `lxc launch -c security.nesting=true archivewarrior warrior1`

# NOTE

This builds a custom version of the archivewarrior machine

It should work the same but it is not guaranteed to
