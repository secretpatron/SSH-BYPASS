#!/bin/bash

# بررسی اینکه آیا جلسه tmux وجود دارد
if ! tmux has-session -t ssh-session 2>/dev/null; then
  echo "Starting new tmux session for SSH..."

  # اتصال به سرور SSH با تلاش مجدد در صورت شکست
  while true; do
    sshpass -p "${SSH_PASSWORD}" ssh -o 'SetEnv SECRET=IKchmmqmqWXCmHKqmTEDilqd' -o ServerAliveInterval=60 -o ServerAliveCountMax=3 root@lulz.segfault.net
    echo "SSH connection lost. Retrying in 10 seconds..."
    sleep 10
  done | tmux new-session -d -s ssh-session
else
  echo "tmux session already exists. Attaching..."
  
  tmux attach-session -t ssh-session
fi
