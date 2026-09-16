#!/usr/bin/env bash
# Deterministic buy/sell-side gate. Re-derives live account state itself --
# does NOT trust numbers the caller/agent supplies -- and exits non-zero if
# any hard rule fails. Callers (agent or human) MUST NOT place an order via
# scripts/alpaca.sh order unless this exits 0.
#
# Usage:
#   bash scripts/validate_trade.sh buy  SYMBOL QTY PRICE CATALYST_DOCUMENTED(0|1)
#   bash scripts/validate_trade.sh sell SYMBOL QTY

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TRADE_LOG="$ROOT/memory/TRADE-LOG.md"

MAX_POSITIONS="${MAX_POSITIONS:-6}"
MAX_POSITION_PCT="${MAX_POSITION_PCT:-0.20}"
MAX_WEEKLY_TRADES="${MAX_WEEKLY_TRADES:-3}"
PDT_EQUITY_THRESHOLD="${PDT_EQUITY_THRESHOLD:-25000}"
PDT_DAYTRADE_LIMIT="${PDT_DAYTRADE_LIMIT:-3}"

fail() { echo "REJECT: $1"; exit 1; }

side="${1:?usage: validate_trade.sh buy|sell SYMBOL QTY [PRICE] [CATALYST_DOCUMENTED]}"
symbol="${2:?symbol required}"
qty="${3:?qty required}"

account_json="$(bash "$ROOT/scripts/alpaca.sh" account)"
positions_json="$(bash "$ROOT/scripts/alpaca.sh" positions)"

equity="$(echo "$account_json" | python3 -c 'import json,sys; print(json.load(sys.stdin)["equity"])')"
cash="$(echo "$account_json" | python3 -c 'import json,sys; print(json.load(sys.stdin)["cash"])')"
daytrade_count="$(echo "$account_json" | python3 -c 'import json,sys; print(json.load(sys.stdin)["daytrade_count"])')"
open_positions="$(echo "$positions_json" | python3 -c 'import json,sys; print(len(json.load(sys.stdin)))')"

if [[ "$side" == "buy" ]]; then
  price="${4:?price required for buy}"
  catalyst_documented="${5:?pass 1 if a catalyst is documented in the RESEARCH-LOG entry for today, else 0}"

  [[ "$catalyst_documented" == "1" ]] || fail "no catalyst documented in today's research log"

  new_total=$((open_positions + 1))
  [[ "$new_total" -le "$MAX_POSITIONS" ]] || fail "would open position $new_total, max is $MAX_POSITIONS"

  cost="$(python3 -c "print(float('$qty') * float('$price'))")"
  max_cost="$(python3 -c "print(float('$equity') * $MAX_POSITION_PCT)")"

  python3 -c "import sys; sys.exit(0 if $cost <= $max_cost else 1)" \
    || fail "position cost \$$cost exceeds ${MAX_POSITION_PCT}x equity (max \$$max_cost)"
  python3 -c "import sys; sys.exit(0 if $cost <= float('$cash') else 1)" \
    || fail "position cost \$$cost exceeds available cash (\$$cash)"

  is_pdt_account="$(python3 -c "print(1 if float('$equity') < $PDT_EQUITY_THRESHOLD else 0)")"
  if [[ "$is_pdt_account" == "1" ]]; then
    [[ "$daytrade_count" -lt "$PDT_DAYTRADE_LIMIT" ]] \
      || fail "daytrade_count $daytrade_count leaves no PDT room (limit $PDT_DAYTRADE_LIMIT on sub-\$${PDT_EQUITY_THRESHOLD} account)"
  fi

  monday="$(python3 -c "import datetime; d=datetime.date.today(); print(d - datetime.timedelta(days=d.weekday()))")"
  today="$(date +%Y-%m-%d)"
  trades_this_week=0
  if [[ -f "$TRADE_LOG" ]]; then
    trades_this_week="$(python3 - "$TRADE_LOG" "$monday" "$today" <<'PYEOF'
import re, sys
path, monday, today = sys.argv[1], sys.argv[2], sys.argv[3]
count = 0
with open(path) as f:
    for line in f:
        m = re.match(r'<!--\s*TRADE\s+side=buy\s+.*?date=(\d{4}-\d{2}-\d{2})', line)
        if m and monday <= m.group(1) <= today:
            count += 1
print(count)
PYEOF
)"
  fi
  [[ "$trades_this_week" -lt "$MAX_WEEKLY_TRADES" ]] \
    || fail "already placed $trades_this_week buy trades this week, max is $MAX_WEEKLY_TRADES"

  echo "PASS: buy $qty $symbol @ \$$price clears all gates (positions $new_total/$MAX_POSITIONS, cost \$$cost, week trade $((trades_this_week + 1))/$MAX_WEEKLY_TRADES, daytrade $daytrade_count)"
  exit 0

elif [[ "$side" == "sell" ]]; then
  held_qty="$(echo "$positions_json" | python3 -c '
import json, sys
symbol = sys.argv[1]
positions = json.load(sys.stdin)
qty = 0
for p in positions:
    if p["symbol"] == symbol:
        qty = p["qty"]
        break
print(qty)
' "$symbol")"
  python3 -c "import sys; sys.exit(0 if float('$held_qty') >= float('$qty') else 1)" \
    || fail "position $symbol only has $held_qty shares, cannot sell $qty"
  echo "PASS: sell $qty $symbol clears gate (holding $held_qty)"
  exit 0
else
  fail "side must be buy or sell"
fi
