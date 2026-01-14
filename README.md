# Claude Code Brand Intelligence Skills

> Powered by [XPOZ MCP Social Intelligence](https://xpoz.ai)

Transform Claude Code into a powerful brand intelligence platform. Analyze social sentiment, discover influencers, and generate competitive insights using real-time Twitter/X data.

## Features

### 3 Specialized Skills

| Skill | Command | Description |
|-------|---------|-------------|
| **Brand Snapshot** | `/brand-snapshot [BRAND]` | Deep-dive analysis with sentiment, narratives, SWOT, and influencers |
| **Brand Competition** | `/brand-competition [BRAND]` | Compare brand vs competitors: share of voice, sentiment, positioning |
| **Brand Influencers** | `/brand-influencers [BRAND]` | Discover influencers by tier, partnership opportunities, rising stars |

### What You Get

- **Real Data**: Fetches actual tweets from Twitter/X via XPOZ MCP
- **Sentiment Analysis**: Classifies tweets as positive/neutral/negative
- **Narrative Extraction**: Identifies 5+ recurring themes in brand conversation
- **SWOT Analysis**: Auto-generates strengths, weaknesses, opportunities, threats
- **Influencer Discovery**: Classifies by tier (Mega/Macro/Micro/Nano) and voice type
- **Beautiful Reports**: Generates standalone HTML reports with dark theme

## Example Reports

See live examples in the [examples/](examples/) folder:

| Report | Description |
|--------|-------------|
| [Tesla Brand Snapshot](examples/Tesla-snapshot-report.html) | Sentiment analysis, narratives, SWOT, influencers |
| [Tesla Competition](examples/Tesla-competition-report.html) | Tesla vs Rivian, BYD, Lucid - share of voice, positioning |
| [Tesla Influencers](examples/Tesla-influencers-report.html) | Influencer discovery, partnership opportunities |

## Quick Start

### Step 1: Set Up Your XPOZ Account (Required First!)

Before installing the skills, you need to configure XPOZ to collect data for your topics of interest:

1. **Sign up for free** at [xpoz.ai](https://xpoz.ai) - click "Start Free"
2. **Go to Settings**: Navigate to [xpoz.ai/settings](https://www.xpoz.ai/settings)
3. **Define your keywords**: This is crucial! XPOZ needs to know which topics to monitor. Add keywords for:
   - Brand names you want to analyze (e.g., "Tesla", "NVIDIA", "Apple")
   - Ticker symbols (e.g., "$TSLA", "$NVDA", "$AAPL")
   - Industry terms relevant to your analysis
4. **Get your API Key**: Scroll to the bottom of the settings page to find your API key

> **Important**: XPOZ collects social posts based on your defined keywords. If you don't configure keywords for a topic, there won't be data available for analysis. Set up your keywords first, then allow some time for data collection before running reports.

### Step 2: Install the Skills

#### Option 1: Clone Repository (Recommended)

```bash
git clone https://github.com/XPOZpublic/xpoz-claude-code-plugins.git
cd xpoz-claude-code-plugins
./install.sh
```

#### Option 2: Manual Install

1. **Copy skills to Claude Code:**

```bash
# Create skills directory if it doesn't exist
mkdir -p ~/.claude/skills

# Copy the skill folders
cp -r skills/brand-snapshot ~/.claude/skills/
cp -r skills/brand-competition ~/.claude/skills/
cp -r skills/brand-influencers ~/.claude/skills/
```

2. **Configure XPOZ MCP Server:**

Add to your Claude Code MCP configuration (`~/.claude.json`):

```json
{
  "mcpServers": {
    "xpoz-mcp": {
      "url": "https://mcp.xpoz.ai/mcp",
      "transport": "http-stream",
      "headers": {
        "Authorization": "Bearer YOUR_XPOZ_API_KEY"
      }
    }
  }
}
```

Replace `YOUR_XPOZ_API_KEY` with the API key from [xpoz.ai/settings](https://www.xpoz.ai/settings).

3. **Verify installation:**

```bash
# In Claude Code, check if skills are loaded
/skills
```

You should see:
- `brand-snapshot`
- `brand-competition`
- `brand-influencers`

## Usage

### Brand Snapshot

Comprehensive single-brand analysis:

```
/brand-snapshot NVIDIA
```

**Output includes:**
- Sentiment score (0-100)
- 5 key narratives with sentiment indicators
- SWOT analysis
- Top influencers with voice type classification
- Key quotes from Twitter

### Brand Competition

Compare brand against competitors:

```
/brand-competition Tesla
```

**Output includes:**
- Share of voice pie chart
- Sentiment comparison across companies
- Competitive positioning analysis
- Cross-company influencer identification

### Brand Influencers

Discover partnership opportunities:

```
/brand-influencers Apple
```

**Output includes:**
- Influencer tier distribution (Mega/Macro/Micro/Nano)
- Voice type classification (analyst, trader, news, official, etc.)
- Partnership scores (0-100)
- Rising stars detection
- Critical voices monitoring

## Configuration Options

### Query Expansion

The skills automatically expand brand names to include ticker symbols:

| Brand | Expanded Query |
|-------|----------------|
| NVIDIA | `"NVIDIA" OR "$NVDA"` |
| Tesla | `"Tesla" OR "$TSLA"` |
| Apple | `"Apple" OR "$AAPL"` |
| Microsoft | `"Microsoft" OR "$MSFT"` |

### Date Range

Default: Last 7 days. The skills use the current date to calculate the date range automatically.

## Troubleshooting

### "No results found"

This usually means XPOZ hasn't collected data for your keywords yet:
1. Go to [xpoz.ai/settings](https://www.xpoz.ai/settings)
2. Verify your keywords are configured correctly
3. Allow time for data collection (new keywords may take a few hours to start populating)

### "MCP server not found"

Ensure the XPOZ MCP server is configured in your Claude Code settings:

```bash
# Check MCP configuration
claude mcp list
```

### "Operation timeout"

The XPOZ API uses async operations. If a query times out:
1. Try a more specific query
2. Reduce the date range
3. Check your API key is valid at [xpoz.ai/settings](https://www.xpoz.ai/settings)

## API Reference

### XPOZ MCP Tools Used

| Tool | Purpose |
|------|---------|
| `getTwitterPostsByKeywords` | Fetch tweets matching brand query |
| `getTwitterUsersByKeywords` | Fetch users discussing brand |
| `checkOperationStatus` | Poll for async operation results |

### Pricing

- **Free**: 100,000 results/month
- **Pro**: $20/month for 1M results
- **Max**: $200/month for 10M results

See [xpoz.ai](https://xpoz.ai) for current pricing.

## License

MIT License - see [LICENSE](LICENSE) for details.

## Support

- **XPOZ Settings**: [xpoz.ai/settings](https://www.xpoz.ai/settings)
- **Issues**: [GitHub Issues](https://github.com/XPOZpublic/xpoz-claude-code-plugins/issues)

---

**Powered by [XPOZ MCP Social Intelligence](https://xpoz.ai)** - Real-time social data for AI applications.
