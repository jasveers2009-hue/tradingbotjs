---
description: Friday weekly review workflow (local test run, uses .env, does not commit/push)
---

STEP 1 -- Read full week context:
- memory/WEEKLY-REVIEW.md (match existing template exactly)
- ALL this week's entries in memory/TRADE-LOG.md
- ALL this week's entries in memory/RESEARCH-LOG.md
- memory/TRADING-STRATEGY.md

STEP 2 -- Pull week-end state:
bash scripts/alpaca.sh account
bash scripts/alpaca.sh positions

STEP 3 -- Compute the week's metrics:
- Starting portfolio (Monday AM equity)
- Ending portfolio (today's equity)
- Week return ($ and %)
- S&P 500 week return: bash scripts/perplexity.sh "S&P 500 weekly performance this week"
- Trades taken (W/L/open), win rate, best/worst trade, profit factor

STEP 4 -- Append a full review section to memory/WEEKLY-REVIEW.md per its
template: stats, closed trades, open positions, what worked/didn't,
lessons, and a letter grade.

STEP 5 -- If a rule should change (proven out 2+ weeks, or failed badly):
do NOT edit memory/TRADING-STRATEGY.md. Append the proposal with reasoning
to memory/STRATEGY-PROPOSALS.md instead, and call it out in the review.

STEP 6 -- Print the summary. Local test run: do not send a notification
and do not commit/push.
