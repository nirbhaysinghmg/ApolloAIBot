#!/usr/bin/env bash
# start-frontend.sh
# Navigates to apolotyreaibot and starts or restarts the frontend serve process on port 5000.
# Detached with nohup, output logged to serve.log, and disowned so it survives logout.

# 1) Change to the project directory
cd ~/apolotyreaibot || {
  echo "Directory ~/apolotyreaibot not found. Aborting."
  exit 1
}

# 2) Kill any existing process listening on port 5000
echo "Stopping any process on port 5000..."
lsof -ti:5000 | xargs -r kill -9

# 3) Start the static server on port 5000, detach it, and log output
nohup npx serve frontend -l 5000 > serve.log 2>&1 &

# 4) Prevent it from being killed when you close the SSH session
disown

echo "Frontend server restarted on port 5000 (logs → serve.log)"
