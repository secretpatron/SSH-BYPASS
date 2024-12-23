#!/bin/bash

# Check if tmux session exists
if ! tmux has-session -t ssh_session 2>/dev/null; then
  tmux new-session -d -s ssh_session "sshpass -p 'segfault' ssh -X -L5900:0:5900 -o 'SetEnv SECRET=IKchmmqmqWXCmHKqmTEDilqd' root@lulz.segfault.net"
fi

# Only attach session if running in a terminal
if [ -t 1 ]; then
  tmux attach-session -t ssh_session
fi
