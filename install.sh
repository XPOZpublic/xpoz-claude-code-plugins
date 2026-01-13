#!/bin/bash

# Claude Code Brand Intelligence Skills Installer
# Powered by XPOZ MCP Social Intelligence - https://xpoz.ai

set -e

echo "=============================================="
echo "  Claude Code Brand Intelligence Installer"
echo "  Powered by XPOZ MCP Social Intelligence"
echo "=============================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILLS_SOURCE="$SCRIPT_DIR/skills"
SKILLS_DEST="$HOME/.claude/skills"

# Check if Claude Code skills directory exists
echo -e "${BLUE}[1/4]${NC} Checking Claude Code installation..."

if [ ! -d "$HOME/.claude" ]; then
    echo -e "${YELLOW}Warning: ~/.claude directory not found.${NC}"
    echo "Creating ~/.claude directory..."
    mkdir -p "$HOME/.claude"
fi

# Create skills directory if it doesn't exist
if [ ! -d "$SKILLS_DEST" ]; then
    echo "Creating skills directory..."
    mkdir -p "$SKILLS_DEST"
fi

echo -e "${GREEN}✓${NC} Claude Code directory ready"
echo ""

# Copy skills
echo -e "${BLUE}[2/4]${NC} Installing skills..."

SKILLS=("brand-snapshot" "brand-competition" "brand-influencers")

for skill in "${SKILLS[@]}"; do
    if [ -d "$SKILLS_SOURCE/$skill" ]; then
        echo "  Installing $skill..."
        cp -r "$SKILLS_SOURCE/$skill" "$SKILLS_DEST/"
        echo -e "  ${GREEN}✓${NC} $skill installed"
    else
        echo -e "  ${RED}✗${NC} $skill not found in package"
    fi
done

echo ""

# Check for XPOZ API key
echo -e "${BLUE}[3/4]${NC} Checking XPOZ MCP configuration..."

CLAUDE_CONFIG="$HOME/.claude.json"

if [ -f "$CLAUDE_CONFIG" ]; then
    if grep -q "xpoz-mcp" "$CLAUDE_CONFIG"; then
        echo -e "${GREEN}✓${NC} XPOZ MCP already configured"
    else
        echo -e "${YELLOW}!${NC} XPOZ MCP not found in config"
        echo ""
        echo "Please add the following to your Claude Code MCP configuration:"
        echo ""
        echo '  "xpoz-mcp": {'
        echo '    "url": "https://mcp.xpoz.ai/mcp",'
        echo '    "transport": "http-stream",'
        echo '    "headers": {'
        echo '      "Authorization": "Bearer YOUR_XPOZ_API_KEY"'
        echo '    }'
        echo '  }'
        echo ""
        echo "Get your API key at: https://xpoz.ai"
    fi
else
    echo -e "${YELLOW}!${NC} Claude Code config file not found"
    echo ""
    echo "You'll need to configure XPOZ MCP manually."
    echo "See README.md for instructions."
fi

echo ""

# Summary
echo -e "${BLUE}[4/4]${NC} Installation complete!"
echo ""
echo "=============================================="
echo -e "${GREEN}  Skills installed successfully!${NC}"
echo "=============================================="
echo ""
echo "Installed skills:"
for skill in "${SKILLS[@]}"; do
    echo -e "  ${GREEN}✓${NC} $skill"
done
echo ""
echo "Next steps:"
echo "  1. Get your XPOZ API key at https://xpoz.ai"
echo "  2. Configure XPOZ MCP in Claude Code (see README.md)"
echo "  3. Run: /brand-snapshot NVIDIA"
echo ""
echo "Documentation: https://xpoz.ai/docs"
echo "Support: https://github.com/xpoz-ai/claude-code-brand-intelligence/issues"
echo ""
echo -e "${BLUE}Powered by XPOZ MCP Social Intelligence${NC}"
echo ""
