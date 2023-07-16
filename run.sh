#/usr/bin/env bash

# Login
crunchy login --credentials "$CRUNCHYROLL_USERNAME:$CRUNCHYROLL_PASSWORD"

# Download
bin/download.sh
