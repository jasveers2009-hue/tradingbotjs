# Strategy Proposals

The weekly-review workflow appends proposed changes to
memory/TRADING-STRATEGY.md here. It never edits that file directly. A human
reviews entries in this file and manually applies the ones they agree with
to TRADING-STRATEGY.md (and to the thresholds in .env / the cloud routine
env vars, if the change is numeric -- e.g. MAX_WEEKLY_TRADES).

Format each entry:

## YYYY-MM-DD -- Proposed by weekly-review

**Current rule:** ...
**Proposed change:** ...
**Evidence:** (2+ weeks of data, or a specific failure this rule caused)
**Status:** pending human review

## 2026-09-25 -- Proposed by weekly-review

**Current rule:** Entry Checklist requires "Specific catalyst? Sector in
momentum? Stop level (7-10% below entry)? Target (min 2:1 R:R)" plus the
hard rule "never within 3% of current price." No rule defines how the
watchlist should track a rejected-as-extended name forward to a future
entry point.

**Proposed change:** When a momentum-sector name is rejected solely for
being extended/chasing (not for lack of catalyst or sector momentum), the
research entry that rejects it should log a concrete watch price (e.g. "re-enter
AMD on a pullback to within 3% of $X" or "watch for first 30-60min
consolidation range on a gap day") so the next session's research can
check that level directly instead of re-evaluating "is this still
extended" from scratch each morning. This doesn't loosen the 3%-chase
rule or the catalyst/momentum requirements -- it just makes the existing
watchlist actionable instead of descriptive.

**Evidence:** Two consecutive weeks (9/16-9/18 and 9/21-9/25), nine
straight trading sessions, zero trades and 0% capital deployed against
the 75-85% target. Every rejection this week (AI/semis 9/22-9/25, AKAM
9/25) correctly identified the setup as extended/chasing but never
produced a specific level to re-check. Week of 9/18-9/25 also marks the
first week the flat-cash approach actively cost performance vs. the
benchmark: bot 0.00% vs. S&P 500 +0.90% (bot -0.90% vs. index), whereas
the prior week's flat cash happened to match a down index week. If
zero-deployment continues a third straight week, the deployment target
itself (75-85%) or the catalyst bar's strictness should be reconsidered,
not just the watchlist mechanics.

**Status:** pending human review

## 2026-10-02 -- Proposed by weekly-review

**Current rule:** Entry Checklist ("Specific catalyst? Sector in
momentum? Stop level? Target?") plus "never within 3% of current price"
and the 75-85% deployment target. The 9/25 proposal (above, still
pending) noted that if zero-deployment continued a third straight week,
"the deployment target itself (75-85%) or the catalyst bar's strictness
should be reconsidered, not just the watchlist mechanics."

**Proposed change:** This is an escalation, not a new mechanism. Two
options for the human reviewer, not mutually exclusive:
1. Apply the 9/25 proposal now (concrete watch-price/pullback-level
   logging per rejected name) so it can actually start changing outcomes
   -- it has been pending two weeks with zero effect because it was never
   applied.
2. If applying (1) does not produce an entry within 1-2 more weeks,
   consider loosening one specific dimension rather than the whole
   checklist -- e.g., for a name rejected solely as "extended" (not for
   lack of catalyst/momentum), allow entry on a defined intraday pullback
   (e.g. first 30-60min range low) same-day instead of requiring a full
   multi-day stabilization, which this market's headline-driven
   volatility (esp. oil/Energy) may never provide.
No change proposed to the hard risk rules (stop %, position sizing, max
positions, max weekly trades) -- only to how a catalyst converts to an
actionable entry.

**Evidence:** Three consecutive weeks (9/16-9/18, 9/21-9/25, 9/28-10/2),
12 straight trading sessions, 0% capital deployed against the 75-85%
target, despite Energy (#1 YTD, +40%) and Technology (#2 YTD, +29%)
holding the top two momentum-sector slots the entire time. Every single
rejection this week was either (a) Energy, rejected on oil's day-to-day
whipsaw (both directions, repeatedly -- 9/29, 9/30, 10/1, 10/2 pre-market
research entries), or (b) Tech/semis, rejected as mixed-signal (Micron
beat but stock faded after-hours, 10/1) or already extended (Accenture
+16% intraday, 10/2) -- never a lack of sector momentum or catalyst
candidates. Opportunity cost is now measurable and cumulative: bot
trailed the index -0.90% the week of 9/18-9/25, and this week's +0.30%
"win" was purely a down-index week, not deployed capital outperforming.

**Status:** pending human review
