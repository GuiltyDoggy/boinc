Run the following from this directory:
`podman run -it --rm -v .:/build:Z,shared fedora`

This will create an Ubuntu container from which we can build the boinc client. Once in the container, this folder will be mounted at `/build` - go to this directory from within the container.

Modify the `build_boinc.sh` script and change the RELEASE_VER to the desired version to be built. See https://boinc.berkeley.edu/trac/wiki/SourceCodeGit for how to list tags. E.g. - run `git tag --list '*/7.24/*'` from within the _boinc_ repository.

Run the `build_boinc.sh` script. This will set up the build environment with all the required tools, will build the client, and place a copy of the built binary back to this directory. This can then be added to the custom images.
