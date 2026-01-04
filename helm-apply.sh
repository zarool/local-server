#!/bin/zsh
SOURCEFILE=$1

if [ -z "$SOURCEFILE" ]; then
    echo "Error: No file path provided."
    echo "Usage: $0 <helm chart inside inside middleware catalog>"
    exit 1
fi

HELMPATH=middleware/$SOURCEFILE/helmfile.yaml

if [ ! -f $HELMPATH ]; then
    echo "Helmfile not found. Exiting."
    exit 1
fi

helmfile sync --file $HELMPATH
