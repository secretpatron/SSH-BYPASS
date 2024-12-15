#!/bin/bash

# Check if tmux session exists
if ! tmux has-session -t ssh-session 2>/dev/null; then
  echo "Starting new tmux session for SSH..."
  # ایجاد یک session جدید tmux برای SSH
  sshpass -p 'segfault' ssh -o 'SetEnv SECRET=YOUR_SECRET_KEY' root@lulz.segfault.net
else
  echo "tmux session already exists. Attaching..."
  # اگر session موجود بود، به آن متصل می‌شود
  tmux attach-session -t ssh-session
fi
