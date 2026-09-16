# Trading Bot (paper trading)

Autonomous swing-trading agent built on Claude Code. Stocks only, no
options. Currently configured for Alpaca **paper** trading.

## Quickstart

1. `cp env.template .env` and fill in your Alpaca (paper) and Perplexity
   keys. `.env` is gitignored -- never commit it.
2. Open this folder in Claude Code.
3. Run `/portfolio` -- should print account equity/cash/positions cleanly
   with no positions yet.
4. Run `/pre-market` to generate today's research log entry.
5. Run `/market-open` to see the (paper) trade execution flow, or
   `/trade SYMBOL SHARES buy` for a manual one-off.

## How rules are enforced

`scripts/validate_trade.sh` re-derives live account state and blocks any
order that violates the strategy (position caps, weekly trade cap, PDT
room, position size). The agent is instructed to call it before every
order, but it's a real script with a real exit code -- not just a
prompt-level suggestion. See CLAUDE.md for the full model.

`memory/TRADING-STRATEGY.md` is edited by a human only. The bot proposes
changes to `memory/STRATEGY-PROPOSALS.md` instead of rewriting its own
rulebook.

## Going to cloud routines / live trading

See `routines/README.md` for cloud routine setup. Don't switch
`ALPACA_ENDPOINT` to the live API until you've watched this run correctly
on paper for a while and are comfortable with what it's doing.
