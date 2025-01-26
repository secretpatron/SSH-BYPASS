#!/bin/bash

SSH_HOST="root@lulz.segfault.net"
SSH_PASS="segfault"

# SSH options
SSH_OPTIONS="-L5900:0:5900 \
             -o 'SetEnv SECRET=IKchmmqmqWXCmHKqmTEDilqd' \
             -o ServerAliveInterval=60 \
             -o ServerAliveCountMax=3"

while true; do
  echo "[INFO] Attempting SSH connection..."
  
  # Establish SSH connection using sshpass and keep the shell open
  sshpass -p "$SSH_PASS" ssh $SSH_OPTIONS -tt "$SSH_HOST" "bash -l"
  
  # Check if session failed
  if [ $? -ne 0 ]; then
    echo "[ERROR] SSH session failed. Retrying in 10 seconds..."
  else
    echo "[INFO] SSH session ended gracefully. Restarting in 10 seconds..."
  fi
  
  # Wait 10 seconds before reconnecting
  sleep 10
done
