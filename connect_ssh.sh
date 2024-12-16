#!/bin/bash

VNC_PORT=5900
REMOTE_SERVER="root@lulz.segfault.net"

# Check if tmux session exists
if ! tmux has-session -t ssh_session 2>/dev/null; then
  echo "Starting new tmux session for SSH..."
  tmux new-session -d -s ssh_session "sshpass -p 'segfault' ssh -L${VNC_PORT}:localhost:${VNC_PORT} -o 'SetEnv SECRET=Nhwod2sFV1tDZNNWuXPBx8Ll' ${REMOTE_SERVER}"
else
  echo "tmux session already exists."
fi

# Check if VNC server is running on remote server (not localhost)
echo "Checking if VNC server is accessible on remote server ${REMOTE_SERVER} at port ${VNC_PORT}..."
if nc -z ${REMOTE_SERVER} ${VNC_PORT}; then
  echo "VNC server is accessible on ${REMOTE_SERVER}. You can connect using: vncviewer localhost:${VNC_PORT}"
else
  echo "Warning: VNC server on remote may not be running or accessible."
fi

# Only attach session if running in a terminal
if [ -t 1 ]; then
  tmux attach-session -t ssh_session
fi
