#!/bin/sh

podman run -d --rm \
  --name cvmfs \
  -e CVMFS_CLIENT_PROFILE=single \
  -e CVMFS_REPOSITORIES=atlas.cern.ch,atlas-condb.cern.ch,grid.cern.ch,unpacked.cern.ch,singularity.opensciencegrid.org,cernvm-prod.cern.ch,sft.cern.ch,alice.cern.ch \
  -e CVMFS_HTTP_PROXY=DIRECT \
  --cap-add SYS_ADMIN \
  --device /dev/fuse \
  --volume "$PWD"/../cvmfs:/cvmfs:Z,shared \
cvmfs/service:latest
