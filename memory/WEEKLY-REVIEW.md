# Weekly Review

Friday reviews appended here. If a rule needs to change, do NOT edit
memory/TRADING-STRATEGY.md -- append the proposal to
memory/STRATEGY-PROPOSALS.md instead and call it out in the review below.

Template for each entry:

## Week ending YYYY-MM-DD

### Stats
| Metric | Value |
|--------|-------|
| Starting portfolio | $X |
| Ending portfolio | $X |
| Week return | ±$X (±X%) |
| S&P 500 week | ±X% |
| Bot vs S&P | ±X% |
| Trades | N (W:X / L:Y / open:Z) |
| Win rate | X% |
| Best trade | SYM +X% |
| Worst trade | SYM -X% |
| Profit factor | X.XX |

### Closed Trades
| Ticker | Entry | Exit | P&L | Notes |

### Open Positions at Week End
| Ticker | Entry | Close | Unrealized | Stop |

### What Worked
- ...

### What Didn't Work
- ...

### Key Lessons
- ...

### Strategy Change Proposals This Week
- See memory/STRATEGY-PROPOSALS.md, or "none"

### Overall Grade: X

## Week ending 2026-09-18

### Stats
| Metric | Value |
|--------|-------|
| Starting portfolio | $100,000.00 |
| Ending portfolio | $100,000.00 |
| Week return | $0.00 (0.00%) |
| S&P 500 week | -0.25% |
| Bot vs S&P | +0.25% |
| Trades | 0 (W:0 / L:0 / open:0) |
| Win rate | N/A (no trades) |
| Best trade | N/A |
| Worst trade | N/A |
| Profit factor | N/A |

### Closed Trades
| Ticker | Entry | Exit | P&L | Notes |
| -- | -- | -- | -- | -- |
| None -- zero trades placed this week | | | | |

### Open Positions at Week End
| Ticker | Entry | Close | Unrealized | Stop |
| -- | -- | -- | -- | -- |
| None | | | | |

### What Worked
- Discipline: every pre-market run correctly HELD when no verified stock-specific catalyst with clean entry/stop/target existed (FOMC day 9/16, reaction day 9/17, triple witching 9/18).
- Untrusted-content policy held: a fabricated "US-Iran war" oil-spike narrative from a low-quality search aggregator was correctly flagged and discarded (9/18 pre-market).
- Zero capital at risk meant the account was flat while the S&P 500 actually dipped -0.25% this week -- bot beat the index by +0.25% this week purely by staying in cash.
- Duplicate/out-of-sequence scheduler firings (pre-market re-run 9/17 10:08 UTC, 9/18 12:11 UTC; EOD re-run 9/17 20:06 UTC) were each correctly identified as non-events and did not trigger duplicate trades or double-counted log entries.
- Account/position state was independently re-verified via live Alpaca pulls at every run rather than trusted from memory.

### What Didn't Work
- Zero trades in 3 consecutive sessions -- 0% capital deployed vs. the 75-85% target. Can't yet judge trade selection or execution because none have been made.
- Energy and Technology/semis have been flagged as the top-momentum watchlist sectors for three straight days without a specific liquid name, entry, stop, or target ever being proposed -- watchlist isn't converting into actionable setups.
- Recurring scheduler anomaly (pre-market and EOD workflows firing multiple times per trading day) has now happened on both trading days this week -- still unresolved, still requires human review of the schedule/trigger config.

### Key Lessons
- "Patience > activity" is working as intended so far, but this is Week 1 of a new account (created 9/16) with only 2 real trading sessions -- too little data to judge whether the HOLD streak reflects genuine lack of setups or over-caution that needs recalibrating. Watch next week closely.
- The watchlist (Energy, Tech/semis) needs to produce a concrete, verified single-name catalyst soon or it isn't earning its keep as a decision input.
- The duplicate-firing scheduler issue is a process risk (could eventually cause a duplicate order in a live-trading session) even though it caused no harm this week; worth escalating again in the notification.

### Strategy Change Proposals This Week
- None. No rule has been proven out over 2+ weeks or has failed badly -- only 2 trading days of history exist so far. If zero-deployment continues through next week, the 75-85%-deployed target vs. the "patience > activity" default may be worth a proposal, but it's premature now.

### Overall Grade: C+

## Week ending 2026-09-25

### Stats
| Metric | Value |
|--------|-------|
| Starting portfolio | $100,000.00 |
| Ending portfolio | $100,000.00 |
| Week return | $0.00 (0.00%) |
| S&P 500 week | +0.90% |
| Bot vs S&P | -0.90% |
| Trades | 0 (W:0 / L:0 / open:0) |
| Win rate | N/A (no trades) |
| Best trade | N/A |
| Worst trade | N/A |
| Profit factor | N/A |

### Closed Trades
| Ticker | Entry | Exit | P&L | Notes |
| -- | -- | -- | -- | -- |
| None -- zero trades placed this week | | | | |

### Open Positions at Week End
| Ticker | Entry | Close | Unrealized | Stop |
| -- | -- | -- | -- | -- |
| None | | | | |

### What Worked
- Every pre-market run continued to correctly HOLD absent a verified, non-extended, single-name catalyst -- rejected AKAM/Anthropic (9/25) despite a real, confirmed catalyst because it was already +23% overnight with a 3.2% spread in a laggard sector, and rejected AI/semis (AMD/INTC/META) all week for being 2-3 sessions extended.
- Untrusted-content discipline held again: no embedded instructions from Perplexity search results were followed at any point this week.
- Account/position state was independently re-verified via live Alpaca pulls at every run rather than trusted from memory.
- Zero capital at risk kept the account flat through a volatile week (10Y yield hit a 19-year high mid-week, VIX popped, oil whipsawed -10%/+3%) that could have stopped out a poorly-timed entry.
- Sector-momentum tracking (Energy #1, Tech #2 all week) stayed consistent and was correctly used to reject an out-of-sector catalyst (AKAM, Communication Services -- a YTD laggard).

### What Didn't Work
- Second consecutive week, and ninth consecutive trading session, with zero trades and 0% capital deployed vs. the 75-85% target -- the bot is now actually trailing the S&P 500 (-0.90% this week) rather than merely matching it, since staying in cash no longer coincided with a down index week.
- The Energy and Technology/semis watchlist has now run for two full weeks without ever converting to an entry. Every AI/semis setup was rejected as "extended" on the day it was checked, but no run ever set a concrete pullback level to watch for -- the watchlist is descriptive, not actionable.
- No EOD snapshot was logged for Sep 23 (Wednesday) -- a gap in the audit trail, though live account data confirmed no state change.
- The recurring scheduler duplicate-firing issue flagged last week (pre-market/EOD workflows firing multiple times per day) was not observed again this week, but also not confirmed fixed -- still an open item for human review.

### Key Lessons
- The entry checklist's anti-chase discipline ("never within 3% of current price") is working exactly as designed, but the watchlist process around it has no mechanism to convert "extended, rejected today" into "here's the specific price level that would make this a clean entry tomorrow." That's the actual gap, not the discipline itself.
- With 2 full weeks of zero deployment now on record, this crosses the "2+ weeks of evidence" bar the last review set for a strategy proposal -- see below.
- The bot no longer gets a free pass on "flat while the index is flat/down" -- this week the index moved and the bot missed the entire move by having no capital deployed. Opportunity cost is now measurable, not theoretical.

### Strategy Change Proposals This Week
- See memory/STRATEGY-PROPOSALS.md -- proposal to add a concrete pullback-trigger mechanism to the watchlist process (2 weeks of zero-deployment evidence).

### Overall Grade: C-
