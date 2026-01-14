# Claude Code Brand Intelligence - Quick Start

## Step 1: Set Up XPOZ (Do This First!)

Before using these skills, XPOZ needs to know what topics to monitor:

1. **Sign up**: Go to [xpoz.ai](https://xpoz.ai) and click **"Start Free"**
2. **Configure keywords**: Navigate to [xpoz.ai/settings](https://www.xpoz.ai/settings)
   - Add brand names you want to analyze (e.g., "Tesla", "NVIDIA")
   - Add ticker symbols (e.g., "$TSLA", "$NVDA")
   - Allow some time for XPOZ to collect posts for your keywords
3. **Get your API key**: Scroll to the bottom of the settings page

> **Why this matters**: XPOZ collects social posts based on YOUR keywords. No keywords = no data for analysis.

## Step 2: Install Skills

```bash
git clone https://github.com/XPOZpublic/xpoz-claude-code-plugins.git
cd xpoz-claude-code-plugins
./install.sh
```

## Step 3: Add Your API Key

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

Replace `YOUR_API_KEY` with the key from [xpoz.ai/settings](https://www.xpoz.ai/settings)

## Step 4: Run Reports

| Command | Description |
|---------|-------------|
| `/brand-snapshot NVIDIA` | Sentiment, narratives, SWOT, influencers |
| `/brand-competition Tesla` | Compare vs auto-detected competitors |
| `/brand-influencers Apple` | Discover influencers by tier |

Reports are saved as HTML files in your current directory.

## Update

```bash
cd xpoz-claude-code-plugins
git pull && ./install.sh
```

## Troubleshooting

**No results?** Check your keywords at [xpoz.ai/settings](https://www.xpoz.ai/settings)

---
Powered by [XPOZ](https://xpoz.ai)
