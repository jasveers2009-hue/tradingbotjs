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

**Status:** pending human review (escalated again 2026-10-09 -- see below)

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

**Status:** pending human review (escalated again 2026-10-09 -- see below)

## 2026-10-09 -- Proposed by weekly-review

**Current rule:** Same as 9/25 and 10/2 above -- Entry Checklist
("Specific catalyst? Sector in momentum? Stop level? Target?"), "never
within 3% of current price," and the 75-85% deployment target. Both the
9/25 proposal (concrete watch-price/pullback-level logging per rejected
name) and the 10/2 escalation (apply 9/25's fix now, or if that doesn't
produce an entry within 1-2 more weeks, loosen the "extended" dimension
specifically to allow same-day intraday-pullback entries) remain
unapplied.

**Proposed change:** This is a second escalation, not a new mechanism.
The 10/2 proposal's own re-evaluation trigger ("if applying (1) does not
produce an entry within 1-2 more weeks, consider loosening...") has now
been met -- it has been two more weeks (10/2 through 10/9) with the 9/25
fix still not applied, so neither option has had a real chance to run.
Recommend the human reviewer pick one explicitly rather than continuing
to defer:
1. Apply the 9/25 watch-price/pullback-level mechanism now, with a hard
   re-check date (e.g. next Friday's review) to assess whether it
   produced any entries; or
2. Apply the 10/2 option 2 directly (allow a name rejected solely as
   "extended" to enter on a defined same-day intraday pullback, e.g.
   first 30-60min range low) since option 1's prerequisite period has
   already elapsed without being tried.
No change proposed to the hard risk rules (stop %, position sizing, max
positions, max weekly trades, PDT room) -- only to how a catalyst
converts to an actionable entry. If neither option is applied before
the next review and zero-deployment continues a 5th week, the next
escalation should consider whether the entire catalyst-checklist
approach (vs. a mechanical momentum-sector allocation) is suited to
this market regime.

**Evidence:** Four consecutive weeks (9/16-9/18, 9/21-9/25, 9/28-10/2,
10/5-10/9), 17 straight trading sessions, 0% capital deployed against
the 75-85% target, with Energy (#1 YTD) and Technology (#2 YTD) holding
the top two momentum-sector slots the entire time without a single
entry. This week was the clearest opportunity-cost evidence yet: the
S&P 500 rose +1.09% (7,722.72 -> 7,807.12) while the bot stayed flat at
$100,000.00, a -1.09% week-over-week gap purely from non-participation,
not a losing trade. Every rejection this week was Energy on oil's
round-trip whipsaw (full reversal of Thursday's Hormuz-attack spike by
Friday morning) or Tech/semis as still multiple sessions extended
through both Thursday's OpenAI-revenue selloff and Friday's bounce --
again never a lack of catalyst or sector momentum.

**Status:** pending human review (escalated again 2026-10-23 -- see below)

## 2026-10-23 -- Proposed by weekly-review

**Current rule:** Same as 9/25, 10/2, and 10/9 above -- Entry Checklist
("Specific catalyst? Sector in momentum? Stop level? Target?"), "never
within 3% of current price," and the 75-85% deployment target. All three
prior proposals (9/25 watch-price/pullback logging; 10/2 option to apply
that or loosen the "extended" dimension for a same-day intraday pullback;
10/9's choice between the two with a hard re-check date) remain unapplied.

**Proposed change:** This is a third escalation. The 10/9 review set an
explicit trigger: "if neither option is applied before the next review
and zero-deployment continues a 5th week, the next escalation should
consider whether the entire catalyst-checklist approach (vs. a mechanical
momentum-sector allocation) is suited to this market regime." That trigger
has now been met exactly -- neither option was applied, and this is the
5th consecutive zero-deployment week. Recommend the human reviewer choose
one of:
1. Apply one of the 9/25/10/2/10/9 mechanisms now, with a hard deadline
   (e.g. end of next week) after which, if still zero trades, the
   catalyst-checklist approach itself (not just its mechanics) is
   replaced or modified for the remainder of the challenge window; or
2. Replace the discretionary catalyst checklist for the #1/#2
   YTD-momentum sectors with a smaller, mechanical allocation rule (e.g.
   a defined-size starter position in the top momentum sector once it
   meets a volatility/spread filter, sized well under the 20%
   single-position cap) so the bot is forced to test real P&L instead of
   continuing to self-select out of every setup; or
3. Explicitly decide current behavior is correct (the market regime
   genuinely has not offered a qualifying setup) and relax only the
   *measurement* bar -- e.g. have the bot log a hypothetical "what if I
   had entered X" P&L alongside each HOLD, so the opportunity-cost
   question can be answered with data instead of inference.
No change proposed to the hard risk rules (stop %, position sizing, max
positions, max weekly trades, PDT room) under any of the three options.

**Evidence:** Five consecutive weeks (9/16-9/18, 9/21-9/25, 9/28-10/2,
10/5-10/9, 10/19-10/23), 28 straight trading sessions, 0% capital deployed
against the 75-85% target, with Energy (#1 YTD, +51-54%) and Technology
(#2 YTD, +20-27%) holding the top two momentum-sector slots the entire
time without a single entry. This week's rejections were again catalyst-
quality calls, not absence of momentum: Energy was rejected as a two-sided
Iran/Israel-strike-plan geopolitical oil spike, and Tech/semis was
rejected as an unconfirmed one-day bounce after Thursday 10/22's worst
Nasdaq session since June. The bot beat the index this week (+0.50%) only
because the index fell -0.50% on a volatile earnings week -- the second
and third such "win by sitting out a down week" instances this cycle
(9/16-9/18, 9/28-10/2), alongside two weeks the bot actively trailed the
index (9/18-9/25: -0.90%; 10/5-10/9: -1.09%). True performance under
deployed capital remains untested after 5 weeks and 28 sessions.

**Status:** pending human review

## 2026-11-06 -- Proposed by weekly-review

**Current rule:** Same as 9/25, 10/2, 10/9, and 10/23 above -- Entry
Checklist ("Specific catalyst? Sector in momentum? Stop level? Target?"),
"never within 3% of current price," and the 75-85% deployment target.
All prior proposals remain unapplied. (This review covers two weeks --
2026-10-30 and 2026-11-06 -- since the 10/30 weekly-review run never fired;
see memory/WEEKLY-REVIEW.md for both entries.)

**Proposed change:** Fourth escalation, with a new wrinkle the human
reviewer should weigh explicitly. The three options from 10/23 (apply a
pending mechanism with a hard deadline; replace the discretionary checklist
with a small mechanical starter allocation; or explicitly bless current
behavior and switch to logging hypothetical "what if I'd entered X" P&L)
are all still on the table. But this cycle (week of 11/2-11/6) included a
sharp, largely unpredictable single-day selloff (S&P -4.36%, Nasdaq -5.52%
into correction territory, 11/5) that the flat account was fully protected
from. That is a genuine counter-data-point to the opportunity-cost argument
that has driven every escalation since 9/25 -- a mechanical
starter-allocation fix (option 2 from 10/23) would have been sitting in a
drawdown through that day. Recommend the human reviewer weigh both sides
(cumulative missed-upside on calm/up weeks vs. this week's protection on a
crash week) rather than treating opportunity cost as one-directional
evidence going forward.

**Evidence:** Seven consecutive weeks since launch (9/16-9/18 through
11/2-11/6), 38 consecutive trading sessions through 11/5 (39th as of this
review), 0% capital deployed against the 75-85% target, with Energy and
Technology holding the top two YTD momentum-sector slots essentially the
entire time without a single qualifying entry. This week specifically:
zero losses during the sharpest single-day drawdown of the cycle (11/5),
but also zero evidence the catalyst bar is reachable in any market
condition tested so far (calm, headline-driven, and now genuinely volatile
weeks have all produced zero entries).

**Status:** pending human review (escalated again 2026-11-13 -- see below)

## 2026-11-06 -- Proposed by weekly-review (operational, not a strategy-rule change)

**Current state:** `scripts/perplexity.sh` has returned HTTP 403 on every
call for six consecutive scheduled runs (2026-10-30, 11-02, 11-03, 11-04,
11-05, 11-06) despite `PERPLEXITY_API_KEY` being confirmed present in the
environment each time. The bot has correctly fallen back to WebSearch per
CLAUDE.md and has not acted on unverified data, but primary research has
effectively been offline for a full calendar week.

**Proposed change:** This is not a TRADING-STRATEGY.md change -- it needs a
human to check the Perplexity account directly (key validity, quota/plan
limit, or an API endpoint change) and rotate `PERPLEXITY_API_KEY` if needed.
No code or rule change is being proposed; flagging here per CLAUDE.md
because it has now met the "escalate clearly" bar after five prior
same-issue log entries with no resolution.

**Evidence:** See Tooling Notes in memory/RESEARCH-LOG.md, 2026-10-30
through 2026-11-06 entries.

**Status:** pending human review (operational fix, not a rule change; escalated again 2026-11-13 -- see below)

## 2026-11-06 -- Proposed by weekly-review (EOD snapshot format gap)

**Current rule:** The daily EOD snapshot format in memory/TRADE-LOG.md
reports portfolio value, cash, day/phase P&L, and open positions/orders.
When the bot holds no position, there is no field for what the broader
market actually did that day.

**Proposed change:** Add a one-line "Market conditions" note to the EOD
snapshot template (e.g. S&P/Nasdaq/Dow day change, VIX) regardless of
whether the bot holds a position, so the audit trail reflects realized
market conditions every session -- not only on days with an open position
to report P&L against.

**Evidence:** The 2026-11-05 EOD snapshot was logged the same day the S&P
500 fell ~4.36% and the Nasdaq fell ~5.52% into correction territory (its
worst single session in roughly 19 months) -- the snapshot entry makes no
mention that this happened. A reader of TRADE-LOG.md alone, without
cross-referencing external sources, would have no way to know 11/5 was an
unusually volatile day.

**Status:** pending human review

## 2026-11-13 -- Proposed by weekly-review

**Current rule:** Same as 9/25, 10/2, 10/9, 10/23, and 11/06 above -- Entry
Checklist ("Specific catalyst? Sector in momentum? Stop level? Target?"),
"never within 3% of current price," and the 75-85% deployment target. All
five prior proposals remain unapplied.

**Proposed change:** Sixth escalation. No new mechanism beyond the three
options already on the table from 10/23 (apply a pending mechanism with a
hard deadline; replace the discretionary checklist with a small mechanical
starter allocation; or explicitly bless current behavior and log
hypothetical "what if I'd entered X" P&L alongside each HOLD). The new
wrinkle: the two most recent weeks bracket the opportunity-cost question
from both directions in rapid succession -- 11/2-11/6 was a crash-protection
week (flat account avoided a -4.36% single-day S&P drop), and this week
(11/9-11/13) was a missed-rebound week (flat account captured none of an
approx. +2.9% index recovery off the 11/6 close). Recommend the human
reviewer treat these two weeks as a paired data point, not separately --
whatever mechanism is chosen (or chosen not to be applied) should be
evaluated against both outcomes together, since the current all-or-nothing
posture guarantees missing one side of every volatile stretch.

**Evidence:** Eight consecutive weeks since launch (9/16-9/18 through
11/9-11/13), 42 consecutive trading sessions, 0% capital deployed against
the 75-85% target, with Energy and Technology holding the top two YTD
momentum-sector slots essentially the entire time without a single
qualifying entry. This week specifically: S&P 500 approx. +2.9%
(7,376.86 -> 7,592.40, two-source corroborated) while the bot captured
none of it -- a clean opportunity-cost week with no offsetting protection
benefit, unlike the week immediately prior.

**Status:** pending human review

## 2026-11-13 -- Proposed by weekly-review (operational, Perplexity outage escalation)

**Current state:** `scripts/perplexity.sh` has now returned HTTP 403 on
every call for an 11th consecutive scheduled trading-day run (2026-10-30,
11-02, 11-03, 11-04, 11-05, 11-06, 11-09, 11-10, 11-11, 11-12, 11-13) --
15 calendar days, a third full calendar week. `PERPLEXITY_API_KEY` is
confirmed present in the environment at every check, so this is an
API-side rejection (invalid/expired key, revoked key, or a quota/plan
limit), not a missing-key issue. The bot has consistently fallen back to
WebSearch and never fabricated data, but primary research has effectively
been offline for three weeks straight.

**Proposed change:** This is a second escalation of the 2026-11-06
operational proposal, which has had zero human action in a week. Given
the duration, recommend the human reviewer either (a) rotate
`PERPLEXITY_API_KEY` directly with Perplexity and confirm the account/plan
is in good standing, or (b) if the key cannot be fixed promptly, formally
accept WebSearch as the primary research tool for now (rather than a
fallback) so the daily workflows stop re-attempting and logging a known-
broken call every session. No code or rule change is being proposed to
TRADING-STRATEGY.md.

**Evidence:** See Tooling Notes in memory/RESEARCH-LOG.md, 2026-10-30
through 2026-11-13 entries (11 consecutive flagged instances).

**Status:** pending human review (operational fix, not a rule change)

## 2026-11-13 -- Proposed by weekly-review (operational, daily-summary EOD-commit gaps)

**Current state:** The daily-summary workflow has repeatedly failed to
commit an EOD snapshot to memory/TRADE-LOG.md on trading days when
pre-market research otherwise ran normally. Confirmed gaps: Oct 1-2,
Oct 21, Nov 2-3, Nov 6, Nov 10, and Nov 12 -- six separate occurrences
across the last ~7 weeks, including two in this week alone (Nov 10
Tuesday, Nov 12 Thursday). Live Alpaca data has confirmed no P&L impact
each time, but the audit trail itself has a growing number of silent gaps,
and the Nov 12 gap wasn't even flagged in the following day's (Nov 13)
TRADE-LOG entry.

**Proposed change:** Not a TRADING-STRATEGY.md change -- recommend a human
directly review the daily-summary scheduled task / trigger configuration
(cloud routine firing conditions, timing, error handling) rather than
continuing to log each individual gap after the fact. If the workflow is
erroring silently rather than simply not firing, that failure mode should
surface somewhere a human sees it promptly (not just a retroactive note
the following trading day).

**Evidence:** See memory/TRADE-LOG.md notes dated Oct 2, Oct 22, Nov 4,
Nov 9, and Nov 11 (each flags the preceding gap), plus this week's two new
gaps (Nov 10, Nov 12) noted in memory/WEEKLY-REVIEW.md's 2026-11-13 entry.

**Status:** pending human review (operational fix, not a rule change)
