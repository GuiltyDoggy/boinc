#!/bin/sh

podman run -d \
  --name boinc \
  --device /dev/dri:/dev/dri \
  --device /dev/kfd:/dev/kfd \
  --net=host \
  --pid=host \
  --group-add video \
  -v "$PWD"/boinc_data:/var/lib/boinc:Z,shared \
  -e BOINC_GUI_RPC_PASSWORD="59e9117580b8e0622382992315b2f106" \
  -e BOINC_CMD_LINE_OPTIONS="--allow_remote_gui_rpc" \
guiltydoggy/boinc-client:amd
