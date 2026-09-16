# Cloud Routines

These five files are the prod path: each one gets pasted verbatim into a
Claude Code cloud routine, scheduled on a cron. Not needed yet -- get the
local .claude/commands/ versions working against paper trading first.

When you're ready to set these up (see the setup guide, Part 7):
1. Install the Claude GitHub App on this repo.
2. For each routine: new Routine -> select this repo/branch -> set env vars
   (ALPACA_API_KEY, ALPACA_SECRET_KEY, ALPACA_ENDPOINT=paper endpoint,
   ALPACA_DATA_ENDPOINT, PERPLEXITY_API_KEY, PERPLEXITY_PRESET, and the
   optional CLICKUP_* vars if you set up notifications) -> enable "Allow
   unrestricted branch pushes" -> set the cron -> paste the matching
   prompt below verbatim -> Run now to test.
5. Keep ALPACA_ENDPOINT pointed at paper-api.alpaca.markets until you've
   watched it run correctly for a while.

Cron schedules (adjust timezone to yours):
- pre-market.md:     0 6 * * 1-5
- market-open.md:    30 8 * * 1-5  (match your market's actual open)
- midday.md:         0 12 * * 1-5
- daily-summary.md:  0 15 * * 1-5  (match your market's actual close)
- weekly-review.md:  0 16 * * 5
