#!/bin/bash
# Claude Code Brand Intelligence - Quick Installer
# Just run: ./install-skills.sh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if we're in the extracted folder or parent
if [ -d "$SCRIPT_DIR/claude-code-brand-intelligence" ]; then
    cd "$SCRIPT_DIR/claude-code-brand-intelligence"
    ./install.sh
elif [ -f "$SCRIPT_DIR/install.sh" ] && [ -d "$SCRIPT_DIR/skills" ]; then
    ./install.sh
else
    echo "Error: Could not find the skills package."
    echo "Make sure you extracted the zip file first."
    exit 1
fi
