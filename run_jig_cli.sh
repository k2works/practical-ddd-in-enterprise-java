#!/bin/sh

# Set the directory containing the scripts
SCRIPT_DIR="ops/sh"

# Loop through all .sh files in the directory
for script in "$SCRIPT_DIR"/*.sh;
do
  # Check if file exists and is readable
  if [ -r "$script" ]; then
    echo "Executing $script"
    # Execute the script
    sh "$script"
  else
    echo "Cannot read $script"
  fi
done
