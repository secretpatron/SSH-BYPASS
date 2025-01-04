#!/bin/bash

SSH_HOST="root@lulz.segfault.net"
SSH_PASS="segfault"

# Command to execute on the server
SSH_CMD="sudo apt-get update -y"

# SSH options
SSH_OPTIONS="-L5900:0:5900 \
             -o 'SetEnv SECRET=IKchmmqmqWXCmHKqmTEDilqd' \
             -o ServerAliveInterval=60 \
             -o ServerAliveCountMax=3"

# Duration limit (in seconds) per session
DURATION_LIMIT=$((5 * 60 * 60))  # 300 minutes = 5 hours

while true; do
  echo "[INFO] Starting new SSH session. Timer: $DURATION_LIMIT seconds..."
  
  # Establish SSH connection
  (timeout $DURATION_LIMIT sshpass -p "$SSH_PASS" ssh $SSH_OPTIONS "$SSH_HOST" "$SSH_CMD")
  
  # If the session ends due to timeout or other issues, re-establish
  echo "[INFO] SSH session ended. Waiting 2 minutes before reconnecting..."
  sleep 120  # Wait 2 minutes as a buffer
done
