---
description: Manual trade helper with deterministic rule validation. Usage -- /trade SYMBOL SHARES buy|sell
---

Execute a manual trade. This is a hardened flow: scripts/validate_trade.sh
is the real gate, not your own judgment. Refuse if it rejects the trade.

Args: SYMBOL SHARES SIDE (buy or sell). If missing, ask.

1. bash scripts/alpaca.sh account
2. bash scripts/alpaca.sh positions
3. bash scripts/alpaca.sh quote SYMBOL (capture ask price as P)
4. If side is buy: confirm a catalyst is documented (today's RESEARCH-LOG
   entry, or ask the user for one now and note it there before proceeding).
   Then run:
   bash scripts/validate_trade.sh buy SYMBOL SHARES P 1
   If side is sell, run:
   bash scripts/validate_trade.sh sell SYMBOL SHARES
5. If validate_trade.sh exits non-zero: STOP. Print the REJECT reason
   verbatim. Do not place the order. Do not suggest a workaround.
6. If it passes: print the order JSON and the validator's PASS line, ask
   "execute? (y/n)".
7. On confirm:
   bash scripts/alpaca.sh order '{"symbol":"SYM","qty":"N","side":"buy|sell","type":"market","time_in_force":"day"}'
8. For BUYs, immediately place a 10% trailing stop GTC:
   bash scripts/alpaca.sh order '{"symbol":"SYM","qty":"N","side":"sell","type":"trailing_stop","trail_percent":"10","time_in_force":"gtc"}'
9. Log to memory/TRADE-LOG.md. For buys, start with the machine-readable
   marker line (see the format note at the top of that file), e.g.:
   <!-- TRADE side=buy symbol=SYM qty=N price=P date=YYYY-MM-DD -->
   Then the human-readable thesis, entry, stop, target, R:R.
10. bash scripts/clickup.sh with trade details (no-op fallback to
    DAILY-SUMMARY.md if no notification channel is configured -- that's
    expected, not an error).
