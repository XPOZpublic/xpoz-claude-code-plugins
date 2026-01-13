# Claude Code Brand Intelligence Skills

> Powered by [XPOZ MCP Social Intelligence](https://xpoz.ai)

Transform Claude Code into a powerful brand intelligence platform. Analyze social sentiment, discover influencers, and generate competitive insights using real-time Twitter/X data.

![Brand Snapshot Example](examples/nvidia_brand_snapshot.html)

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
- **Analyst Consensus**: Extracts price targets and analyst opinions
- **Beautiful Reports**: Generates standalone HTML reports with dark theme

## Quick Start

### Prerequisites

- [Claude Code CLI](https://claude.ai/claude-code) installed
- [XPOZ API Key](https://xpoz.ai) (sign up for free)

### Installation

#### Option 1: Automated Install (Recommended)

```bash
# Clone the repo
git clone https://github.com/hossenco/claude-skills-automation.git
cd claude-skills-automation

# Run the installer
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

Add to your Claude Code MCP configuration (`~/.claude.json` or via Claude Code settings):

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

Replace `YOUR_XPOZ_API_KEY` with your actual API key from [xpoz.ai](https://xpoz.ai).

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
- Analyst consensus with price targets
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

## Example Output

See the [examples](examples/) folder for sample HTML reports:

- [NVIDIA Brand Snapshot](examples/nvidia_brand_snapshot.html)

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

### Minimum Data Requirements

| Skill | Tweets | Influencers |
|-------|--------|-------------|
| Brand Snapshot | 200+ | 50+ |
| Brand Competition | 100+ per company | 30+ |
| Brand Influencers | 100+ | 200+ |

## Troubleshooting

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
3. Check your API key is valid

### "No results found"

- Verify the brand name is spelled correctly
- Try including the ticker symbol manually
- Check if the brand has significant Twitter presence

## API Reference

### XPOZ MCP Tools Used

| Tool | Purpose |
|------|---------|
| `getTwitterPostsByKeywords` | Fetch tweets matching brand query |
| `getTwitterUsersByKeywords` | Fetch users discussing brand |
| `checkOperationStatus` | Poll for async operation results |

### Rate Limits

Check your XPOZ plan for rate limits at [xpoz.ai/pricing](https://xpoz.ai/pricing).

## Contributing

Contributions welcome! Please read our [Contributing Guide](CONTRIBUTING.md) first.

## License

MIT License - see [LICENSE](LICENSE) for details.

## Support

- **Documentation**: [xpoz.ai/docs](https://xpoz.ai/docs)
- **Issues**: [GitHub Issues](https://github.com/hossenco/claude-skills-automation/issues)
- **Discord**: [Join our community](https://discord.gg/xpoz)

---

**Powered by [XPOZ MCP Social Intelligence](https://xpoz.ai)** - Real-time social data for AI applications.
