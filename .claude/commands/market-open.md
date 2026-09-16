---
description: Market-open execution workflow (local test run, uses .env, does not commit/push)
---

STEP 1 -- Read today's plan:
- memory/TRADING-STRATEGY.md
- TODAY's entry in memory/RESEARCH-LOG.md (if missing, run the pre-market
  research steps inline first -- never trade without documented research)
- tail of memory/TRADE-LOG.md

STEP 2 -- Re-validate with live data:
bash scripts/alpaca.sh account
bash scripts/alpaca.sh positions
bash scripts/alpaca.sh quote <each planned ticker>
Check bid/ask spread, make sure nothing is halted.

STEP 3 -- For each planned trade, run the deterministic gate BEFORE placing
any order:
bash scripts/validate_trade.sh buy SYMBOL QTY PRICE 1
(pass the 5th arg as 1 only if a catalyst is genuinely documented in
today's RESEARCH-LOG entry for that ticker)
If it exits non-zero, skip that trade and log the REJECT reason verbatim
to memory/TRADE-LOG.md. Do not override, do not re-run with different
numbers to force a pass.

STEP 4 -- For each trade that passed validation: place a market buy (day
time-in-force), wait for fill, then immediately place a 10% trailing_stop
as a GTC order:
bash scripts/alpaca.sh order '{"symbol":"SYM","qty":"N","side":"buy","type":"market","time_in_force":"day"}'
bash scripts/alpaca.sh order '{"symbol":"SYM","qty":"N","side":"sell","type":"trailing_stop","trail_percent":"10","time_in_force":"gtc"}'
If Alpaca rejects the trailing stop for a PDT reason, fall back to a fixed
stop 10% below entry. If that's also blocked, note "PDT-blocked, set stop
tomorrow AM" in the trade log.

STEP 5 -- Append every trade to memory/TRADE-LOG.md. For buys, start with
the machine-readable marker line (required for validate_trade.sh's weekly
cap to work):
<!-- TRADE side=buy symbol=SYM qty=N price=P date=YYYY-MM-DD -->
Then the human-readable thesis, entry, stop, target, R:R.

STEP 6 -- Print a summary. Local test run: do not send a notification and
do not commit/push.
