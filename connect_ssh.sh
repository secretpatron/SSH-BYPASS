8#!/bin/bash

if ! tmux has-session -t ssh-session 2>/dev/null; then
  echo "Starting new tmux session for SSH..."

  while true; do
    sshpass -p "segfault" ssh -L5900:localhost:5900 -o 'SetEnv SECRET=IKchmmqmqWXCmHKqmTEDilqd' -o ServerAliveInterval=60 -o ServerAliveCountMax=3 root@lulz.segfault.net "sudo apt-get update -y && sudo --autoremove purge && bash /root/ok.sh"
    echo "SSH connection lost. Retrying in 10 seconds..."
    sleep 10
  done | tmux new-session -d -s ssh-session
else
  echo "tmux session already exists. Attaching..."
  
  tmux attach-session -t ssh-session
fi
