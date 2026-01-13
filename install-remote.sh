#!/bin/bash
# Claude Code Brand Intelligence - One-Line Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/hossenco/claude-skills-automation/main/install-remote.sh | bash

set -e

echo "=============================================="
echo "  Claude Code Brand Intelligence Installer"
echo "  Powered by XPOZ MCP Social Intelligence"
echo "=============================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SKILLS_DEST="$HOME/.claude/skills"
TEMP_DIR=$(mktemp -d)
REPO_URL="https://github.com/hossenco/claude-skills-automation/archive/refs/heads/main.zip"

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo -e "${BLUE}[1/4]${NC} Downloading skills package..."
curl -fsSL "$REPO_URL" -o "$TEMP_DIR/package.zip"
echo -e "${GREEN}✓${NC} Downloaded"

echo -e "${BLUE}[2/4]${NC} Extracting..."
unzip -q "$TEMP_DIR/package.zip" -d "$TEMP_DIR"
echo -e "${GREEN}✓${NC} Extracted"

echo -e "${BLUE}[3/4]${NC} Installing skills..."

# Create directories
mkdir -p "$SKILLS_DEST"

# Copy skills
SKILLS=("brand-snapshot" "brand-competition" "brand-influencers")
for skill in "${SKILLS[@]}"; do
    cp -r "$TEMP_DIR/claude-skills-automation-main/skills/$skill" "$SKILLS_DEST/"
    echo -e "  ${GREEN}✓${NC} $skill installed"
done

echo ""
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
echo "  2. Configure XPOZ MCP in Claude Code:"
echo ""
echo '     Add to ~/.claude.json:'
echo '     {'
echo '       "mcpServers": {'
echo '         "xpoz-mcp": {'
echo '           "url": "https://mcp.xpoz.ai/mcp",'
echo '           "transport": "http-stream",'
echo '           "headers": {'
echo '             "Authorization": "Bearer YOUR_XPOZ_API_KEY"'
echo '           }'
echo '         }'
echo '       }'
echo '     }'
echo ""
echo "  3. Run: /brand-snapshot NVIDIA"
echo ""
echo "Documentation: https://xpoz.ai/docs"
echo "Support: https://github.com/hossenco/claude-skills-automation/issues"
echo ""
echo -e "${BLUE}Powered by XPOZ MCP Social Intelligence${NC}"
echo ""
