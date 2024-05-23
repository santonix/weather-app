#!/bin/sh
set -e

# If the first argument is `dockerd`, then we run the Docker daemon
if [ "$1" = 'dockerd' ]; then
    # Run Docker daemon in background
    dockerd &
    # Wait for Docker daemon to start
    while (! docker info > /dev/null 2>&1); do
        echo "Waiting for Docker daemon to start..."
        sleep 1
    done
    # Run other commands, if any
    exec "$@"
else
    # If not running dockerd, then run the specified command
    exec "$@"
fi
