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
