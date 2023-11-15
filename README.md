# boinc
This is a repository that facilitates building the boinc client binary and creating a container image. It is based on the work done by https://github.com/BOINC. 

The official boinc packages from various distributions tend to have outdated boinc clients, and the official [Docker images](https://hub.docker.com/r/boinc/client/#!) are outdated as well.

This repo aims to fix those issues. It will produce a container image that has the latest boinc client with the capability to run jobs using AMD GPUs as well.

If you just want to pull the latest image and run, go to https://hub.docker.com/repository/docker/guiltydoggy/boinc-client/general

Otherwise, see the steps below for how to use this repo to customize/make your own container image.

Steps to use:
1. Clone this repo
2. Follow the steps in the build/ directory. This will create a new build environment in a Ubuntu container and builds the binaries
3. Run ./push_to_dockerhub.sh from this directory (modify this first to your personal container registry of choice).
4. Run ./run_boinc.sh from this directory. This will create a container which runs the boinc client. Modify this script to pull from your container registry.
5. Use whichever Boinc Manager you want to connect to the client, now running on localhost, using the RPC password defined in run_boinc.sh
