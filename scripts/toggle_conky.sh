#!/bin/bash

# A simple script, that starts a conky process.
# If such a process already exists, the script kills it.

CONKYS=$(/usr/bin/pgrep -c conky)
echo $CONKYS

# if there are NO active "conky" processes, start one
if [ "$CONKYS" == 0 ]; then
	/usr/bin/conky &
# if there ARE, kill them all
else
	/usr/bin/killall conky
fi
