---
description: Daily EOD summary workflow (local test run, uses .env, does not commit/push)
---

STEP 1 -- Read for continuity:
- tail of memory/TRADE-LOG.md (find most recent EOD snapshot -> yesterday's
  equity, needed for Day P&L)
- Count TRADE-LOG entries dated today (for "Trades today")
- Count trades Mon-today this week (for the 3/week cap)

STEP 2 -- Pull final state of the day:
bash scripts/alpaca.sh account
bash scripts/alpaca.sh positions
bash scripts/alpaca.sh orders

STEP 3 -- Compute metrics:
- Day P&L ($ and %) = today_equity - yesterday_equity
- Phase cumulative P&L ($ and %) = today_equity - starting_equity
- Trades today (list or "none")
- Trades this week (running total)

STEP 4 -- Append EOD snapshot to memory/TRADE-LOG.md:
### MMM DD -- EOD Snapshot (Day N, Weekday)
**Portfolio:** $X | **Cash:** $X (X%) | **Day P&L:** ±$X (±X%) | **Phase P&L:** ±$X (±X%)
| Ticker | Shares | Entry | Close | Day Chg | Unrealized P&L | Stop |
**Notes:** one-paragraph plain-english summary.

STEP 5 -- Print the summary (<=15 lines). Local test run: do not send a
notification and do not commit/push -- but note that in the real cloud
routine this commit is mandatory, since tomorrow's Day P&L depends on it.
