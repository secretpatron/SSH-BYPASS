8#!/bin/bash

if ! tmux has-session -t ssh-session 2>/dev/null; then
  echo "Starting new tmux session for SSH..."

  while true; do
    sshpass -p "segfault" ssh -L43079:0:43079 -o 'SetEnv SECRET=IKchmmqmqWXCmHKqmTEDilqd' -o ServerAliveInterval=60 -o ServerAliveCountMax=3 root@lulz.segfault.net "bash ok.sh"
    echo "SSH connection lost. Retrying in 10 seconds..."
    sleep 10
  done | tmux new-session -d -s ssh-session
else
  echo "tmux session already exists. Attaching..."
  
  tmux attach-session -t ssh-session
fi
