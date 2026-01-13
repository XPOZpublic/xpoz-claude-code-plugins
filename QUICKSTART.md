# Claude Code Brand Intelligence - Quick Start

## Installation

```bash
git clone https://github.com/hossenco/claude-skills-automation.git
cd claude-skills-automation
./install.sh
```

## Update

```bash
cd claude-skills-automation
git pull && ./install.sh
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
