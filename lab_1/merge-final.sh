pdft#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pdftk "$SCRIPT_DIR/Панченко_Сергій_ІП_51_мн_1_pre.pdf" "$SCRIPT_DIR/diagram/lab.pdf" cat output  "Панченко_Сергій_ІП_51_мн_1.pdf"