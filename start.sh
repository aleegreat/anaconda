#!/usr/bin/bash
echo "step1 start kite..............."
su - abc -c "/home/abc/.local/share/kite/kited " &

echo "step2 tail..............."
# /home/abc/Anaconda3/bin/jupyter-lab "$*"
tail -f /dev/null
