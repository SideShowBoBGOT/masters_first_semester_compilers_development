#!/bin/bash

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp "$SCRIPT_DIR/diagram/lab.rrd" "$SCRIPT_DIR/diagram/lab.html"
google-chrome-stable --headless --disable-gpu --no-pdf-header-footer --print-to-pdf="$SCRIPT_DIR/diagram/lab.pdf" "file://$SCRIPT_DIR/diagram/lab.html"