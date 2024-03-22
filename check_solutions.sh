#!/bin/bash

#Find current lock file
FILE=$(ls stats.*.lock | sort -t. -k2,2n | tail -n 1)
FOUND_SOLUTIONS=$(jq '.FoundSolutions' "$FILE")
FILE_PATH=$(pwd)
EMAIL=$(jq -r '.email' "$FILE_PATH/config.json")
NODE_NAME=$(jq -r '.alias' "$FILE_PATH/config.json")
SAVE_FILE="$FILE_PATH/Solutions.txt"

if [ ! -f "$SAVE_FILE" ]; then
    echo "$FOUND_SOLUTIONS" > "$SAVE_FILE"
fi

old_value=$(cat "$SAVE_FILE")

if [ "$FOUND_SOLUTIONS" -gt "$old_value" ]; then
    echo "$FOUND_SOLUTIONS" > "$SAVE_FILE"
    
    echo "Found $((FOUND_SOLUTIONS-old_value)) New Solutions, total solutions on $NODE_NAME are $FOUND_SOLUTIONS" | mail -s "$NODE_NAME" "$EMAIL"
fi
