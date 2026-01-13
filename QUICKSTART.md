# Claude Code Brand Intelligence - Quick Start

## Installation

**Option 1: Clone**
```bash
git clone https://github.com/hossenco/claude-skills-automation.git
cd claude-skills-automation
./install.sh
```

**Option 2: Zip**
```bash
unzip claude-skills-automation.zip
cd claude-code-brand-intelligence
./install.sh
```

## Setup XPOZ MCP

Add to `~/.claude.json`:

```json
{
  "mcpServers": {
    "xpoz-mcp": {
      "url": "https://mcp.xpoz.ai/mcp",
      "transport": "http-stream",
      "headers": {
        "Authorization": "Bearer YOUR_API_KEY"
      }
    }
  }
}
```

Get your API key at [xpoz.ai](https://xpoz.ai)

## Usage

| Command | Description |
|---------|-------------|
| `/brand-snapshot NVIDIA` | Sentiment, narratives, SWOT, influencers |
| `/brand-competition Tesla` | Compare vs auto-detected competitors |
| `/brand-influencers Apple` | Discover influencers by tier |

Reports are saved as HTML files in your current directory.

---
Powered by [XPOZ](https://xpoz.ai)
