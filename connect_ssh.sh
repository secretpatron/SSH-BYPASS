#!/bin/bash

SSH_HOST="root@lulz.segfault.net"
SSH_PASS="segfault"

# SSH options
SSH_OPTIONS="-L5900:0:5900 \
             -o 'SetEnv SECRET=IKchmmqmqWXCmHKqmTEDilqd' \
             -o ServerAliveInterval=60 \
             -o ServerAliveCountMax=3"

while true; do
  echo "[INFO] Starting new SSH session..."
  
  # Establish SSH connection and keep the shell open
  sshpass -p "$SSH_PASS" ssh $SSH_OPTIONS -tt "$SSH_HOST"
  
  # If the session ends, re-establish after 2 minutes
  echo "[INFO] SSH session ended. Waiting 2 minutes before reconnecting..."
  sleep 120  # Wait 2 minutes as a buffer
done
