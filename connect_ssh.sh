#!/bin/bash

# پورت VNC برای فورواردینگ
VNC_PORT=5900

# Check if tmux session exists
if ! tmux has-session -t ssh_session 2>/dev/null; then
  echo "Starting new tmux session for SSH..."
  tmux new-session -d -s ssh_session "sshpass -p 'segfault' ssh -L${VNC_PORT}:localhost:${VNC_PORT} -o 'SetEnv SECRET=8lgm-Nhwod2sFV1tDZNNWuXPBx8Ll' root@lulz.segfault.net"
else
  echo "tmux session already exists."
fi

# Check if VNC server is running on remote
echo "Checking if VNC server is accessible on localhost:${VNC_PORT}..."
if nc -z localhost ${VNC_PORT}; then
  echo "VNC server is accessible. You can connect using: vncviewer localhost:${VNC_PORT}"
else
  echo "Warning: VNC server on remote may not be running or accessible."
fi

# Only attach session if running in a terminal
if [ -t 1 ]; then
  tmux attach-session -t ssh_session
fi
