#!/usr/bin/env bash
# restart-backend.sh

# 1) Kill any existing app.py
pkill -f "python3 app.py"

# 2) Give it a second to shut down (optional)
sleep 1

# 3) Start the new one
nohup python3 app.py > backend.log 2>&1 &
disown

echo "Backend restarted (logs → backend.log)"
