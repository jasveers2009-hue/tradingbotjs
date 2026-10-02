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

## Week ending 2026-10-02

### Stats
| Metric | Value |
|--------|-------|
| Starting portfolio | $100,000.00 |
| Ending portfolio | $100,000.00 |
| Week return | $0.00 (0.00%) |
| S&P 500 week | -0.30% |
| Bot vs S&P | +0.30% |
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
- Discipline held across all 5 sessions (9/28-10/2): correctly HOLD on every borderline setup -- Energy/oil's day-to-day whipsaw rejected repeatedly rather than chased on a single-day bounce, Micron's beat-and-raise rejected as a mixed signal (stock faded after hours despite the beat), Accenture's +16% pop and Nike's miss both rejected as out-of-scope/already-extended.
- Entry checklist correctly screened out binary-macro-event risk: PCE (9/30), four Fed speeches (10/1), and the September jobs report (10/2) were each explicitly flagged and used as a reason to stay flat rather than front-run the print.
- Account/position state independently re-verified via live Alpaca pulls every session rather than trusted from memory -- zero data-integrity issues this week.
- Untrusted-content discipline held: no Perplexity/search-result instructions acted on; internally inconsistent oil-price feeds (a recurring theme all week) correctly treated as noise, not a tradeable signal.
- Bot beat the index this week (+0.30%) by being flat while the S&P 500 itself dipped -0.3% -- but this is a down-week coincidence, not evidence the approach is working (see below).

### What Didn't Work
- Third consecutive week, 12th consecutive trading session, 0% capital deployed vs. the 75-85% target -- this is now a structural pattern, not noise.
- The 9/25 proposal's own stated re-evaluation trigger ("if zero-deployment continues a third straight week, the deployment target itself or catalyst bar's strictness should be reconsidered") has now been met. The watchlist-actionability fix proposed 9/25 is still "pending human review" -- unapplied for two weeks running, so it hasn't had a chance to change behavior yet.
- Energy (#1 YTD momentum, +40%) and Technology (#2, +29%) sat on the watchlist for all 12 sessions straight without a single concrete, non-extended entry ever clearing the checklist. Oil's session-to-session whipsaw (both directions, repeatedly, all week) made Energy unsizeable every single day; Tech/semis' only two fresh catalysts this week (Micron beat, Accenture pop) were each rejected as mixed-signal or already >15% extended.
- Opportunity cost is now cumulative: 2 of the last 3 weeks the index moved and the bot sat in cash both times (9/18-9/25: bot -0.90% vs. index; this week the bot only "won" because the index itself was down).
- No new single-name, non-extended, momentum-sector catalyst has converted to an entry in 12 sessions despite two YTD-leading sectors sitting at the top of the watchlist the entire time -- same gap flagged 9/25, now with 50% more evidence behind it.

### Key Lessons
- "Patience > activity" can no longer be distinguished from "the catalyst bar is effectively unreachable in current market conditions" without either (a) applying the pending 9/25 watchlist-actionability fix, or (b) a human recalibrating the catalyst/deployment rules directly. Three weeks of pure HOLD is enough evidence to act on, not enough to keep self-diagnosing.
- Oil-driven Energy setups have failed the "non-extended, stable trend" bar in every single session this cycle, whipsawing both directions on geopolitical headlines -- this specific sector/catalyst combination may need its own volatility-aware handling rather than being treated like an ordinary momentum setup.
- Binary macro-event risk (FOMC, PCE, jobs reports, multiple Fed speakers) keeps consuming entry windows -- across 3 weeks, multiple sessions were explicitly HELD because a scheduled macro print was pending. Correct discipline, but it is also mechanically reducing the number of tradeable days; noted as a contributing factor, not an excuse.

### Strategy Change Proposals This Week
- Escalation of the 9/25 proposal -- see memory/STRATEGY-PROPOSALS.md. Zero-deployment has now reached 3 consecutive weeks / 12 consecutive sessions, the exact evidence threshold the 9/25 review set for reconsidering the deployment target or catalyst-bar strictness, while the original fix is still unapplied.

### Overall Grade: D+
