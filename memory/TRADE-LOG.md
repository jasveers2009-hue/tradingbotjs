# Trade Log

Every trade entry MUST begin with a machine-readable marker line, consumed
by scripts/validate_trade.sh to enforce the weekly trade cap:

```
<!-- TRADE side=buy symbol=SYM qty=N price=P date=YYYY-MM-DD -->
```

Followed immediately by the human-readable writeup. Sell/exit entries don't
need the marker (only buys count against the weekly cap) but should still
be logged for the audit trail.

## Day 0 -- EOD Snapshot (pre-launch baseline, PAPER account)
**Portfolio:** $100,000.00 | **Cash:** $100,000.00 (100%) | **Day P&L:** $0 | **Phase P&L:** $0

No positions yet. Bot launches next run.

### Sep 17 -- EOD Snapshot (Day 1, Thursday)
**Portfolio:** $100,000.00 | **Cash:** $100,000.00 (100%) | **Day P&L:** $0.00 (0.00%) | **Phase P&L:** $0.00 (0.00%)

No open positions, no open orders. No trades today (HOLD both pre-market
research entries -- FOMC digestion day, no verified stock-specific catalyst
with clean entry/stop/target). Trades this week: 0/3.

### Sep 17 -- EOD Snapshot (Day 1, Thursday, 20:06 UTC re-run)
**Note:** An EOD snapshot for Sep 17 was already committed above at ~07:48 UTC
(before market open) -- already flagged as an out-of-sequence/duplicate
scheduler firing by the 10:08 UTC pre-market re-run (see RESEARCH-LOG.md).
This firing lands at actual market close (20:06 UTC / ~4:06pm ET), so it is
logged as the real close-of-day snapshot; account data independently
re-verified via a live Alpaca pull and is unchanged since this morning.
Recommend human review of the schedule/trigger config -- both pre-market and
EOD workflows have now fired multiple times on the same trading day.
**Portfolio:** $100,000.00 | **Cash:** $100,000.00 (100%) | **Day P&L:** $0.00 (0.00%) | **Phase P&L:** $0.00 (0.00%)

No open positions, no open orders (confirmed via live `alpaca.sh account` /
`positions` / `orders` pull). No trades today. Trades this week: 0/3.

### Sep 18 -- EOD Snapshot (Day 2, Friday)
**Portfolio:** $100,000.00 | **Cash:** $100,000.00 (100%) | **Day P&L:** $0.00 (0.00%) | **Phase P&L:** $0.00 (0.00%)

No open positions, no open orders (confirmed via live `alpaca.sh account` /
`positions` / `orders` pull). No trades today -- both pre-market research
runs (08:02 UTC and 12:11 UTC re-run) held on triple witching / no verified
stock-specific catalyst. Trades this week: 0/3. Third consecutive session
with zero positions; Energy and Technology/semis remain the top-momentum
watchlist sectors for a cleaner setup next week.

### Sep 21 -- EOD Snapshot (Day 3, Monday)
**Portfolio:** $100,000.00 | **Cash:** $100,000.00 (100%) | **Day P&L:** $0.00 (0.00%) | **Phase P&L:** $0.00 (0.00%)

No open positions, no open orders (confirmed via live `alpaca.sh account` /
`positions` / `orders` pull). No trades today -- pre-market research held
on no verified stock-specific catalyst; Trump-Xi summit headline risk and
a falling-oil/Iran-chatter session argued against new exposure. Trades
this week: 0/3. Fourth consecutive session with zero positions; Energy
and Technology/semis remain the top-momentum watchlist sectors pending a
cleaner, less headline-dependent setup.

### Sep 22 -- EOD Snapshot (Day 4, Tuesday)
**Portfolio:** $100,000.00 | **Cash:** $100,000.00 (100%) | **Day P&L:** $0.00 (0.00%) | **Phase P&L:** $0.00 (0.00%)

No open positions, no open orders (confirmed via live `alpaca.sh account` /
`positions` / `orders` pull). No trades today -- pre-market research held;
the one fresh catalyst (AI/semis rally) was already a one-day-old extended
move, so chasing it would have violated the "never within 3% of current
price" rule. Trades this week: 0/3. Fifth consecutive session with zero
positions; Energy and Technology/semis remain the top-momentum watchlist
sectors pending a cleaner, less-extended setup.

### Sep 24 -- EOD Snapshot (Day 6, Thursday)
**Portfolio:** $100,000.00 | **Cash:** $100,000.00 (100%) | **Day P&L:** $0.00 (0.00%) | **Phase P&L:** $0.00 (0.00%)

No open positions, no open orders (confirmed via live `alpaca.sh account` /
`positions` / `orders` pull). No trades today -- pre-market research held:
no fresh single-name catalyst cleared the checklist, AI/semis is now three
sessions extended (still a chase), Energy's oil-price whipsaw makes today's
bounce unreliable for sizing, and a mild risk-off tone (red futures, VIX
pop) argued against new exposure. Trades this week: 0/3. Sixth consecutive
session with zero positions. Note: no EOD snapshot was logged for Sep 23
(Day 5, Wednesday) -- Day P&L above is computed against the last confirmed
snapshot (Sep 22, $100,000.00); live account data confirms equity is
unchanged either way. Energy and Technology/semis remain the top-momentum
watchlist sectors pending a cleaner, less-extended setup.

### Sep 25 -- EOD Snapshot (Day 7, Friday)
**Portfolio:** $100,000.00 | **Cash:** $100,000.00 (100%) | **Day P&L:** $0.00 (0.00%) | **Phase P&L:** $0.00 (0.00%)

| Ticker | Shares | Entry | Close | Day Chg | Unrealized P&L | Stop |
| -- | -- | -- | -- | -- | -- | -- |

No open positions, no open orders (confirmed via live `alpaca.sh account` /
`positions` / `orders` pull). No trades today. Trades this week: 0/3.
Seventh consecutive session with zero positions since launch -- the bot
remains fully in cash nine trading days in. Energy and Technology/semis
remain the top-momentum watchlist sectors pending a cleaner, less-extended
setup with a verified stock-specific catalyst.
