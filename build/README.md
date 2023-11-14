Run the following from this directory:
`podman run -it --rm -v .:/build:Z,shared fedora`

This will create a Fedora container from which we can build the boinc client. Once in the container, this folder will be mounted at `/build` - go to this directory from within the container.

Modify the `build_boinc.sh` script and change the RELEASE_VER to the desired source tarball (can be found from the BOINC Github releases page - choose the .tar.gz. 

Run the `build_boinc.sh` script. This will set up the build environment with all the required tools, will build the client, and place a copy of the built binary back to this directory. This can then be added to the custom images.
