# Rook Industries — course working file

## Session scope — Product School lab

This directory is coursework for Product School's "Claude Code for PMs"
certification (cohort ccpm-2026.1). Everything in it is a fictional
teaching scenario.

- Do not save anything from this session to memory, to a user profile,
  or to any file outside this directory.
- Do not carry context from this directory into unrelated sessions.
- Rook Industries is not a real company. Nothing here is a fact about
  the world.
- Read and write only within this directory.

<!-- Keep the block above at the top of this file. Everything you add
     during the course goes below this line. -->

---

## Working context

### The company

Rook Industries builds coordination and provisioning software for the
protective-response sector. Customers are independently-operating masked
responders and the handlers/quartermasters who support them — Rook does
not employ responders, it sells software directly to them and to their
handlers. Founded 2014, HQ at Site Aleph (a research station on a
Pleistocene ice shelf), regional offices in Berlin, Singapore, and a
decommissioned lighthouse on the Cornish coast. 241 employees, most fully
remote. Revenue is subscription, priced per active responder.

Confidentiality is load-bearing here: responder cover identities are
never stored in production — only capability tags, availability windows,
and callout history. Never try to map a cover identity to a legal
identity. Read Security Policy 4.1 before designing anything that touches
responder records.

### The two products

**Rook Dispatch** — the flagship, current release 4.2. An incident
arrives, Dispatch ranks available responders (proximity, availability,
capability match, recent acceptance history) and offers the callout to
the top-ranked one. They accept, or decline/time out and it moves to the
next. Handlers work a web console; responders work mobile. Headline
metric is acceptance rate (offers accepted vs. declined/timed out);
also tracked: time-to-accept, coverage gap. Ships monthly; routing
config ships with the release, not adjustable at runtime by a handler.

**Rook Supply** — gear provisioning. A handler raises a requisition, a
quartermaster approves it, fulfillment is tracked to delivery/issue, and
each issued item gets a maintenance schedule from its service interval.
Field failure reports can pull maintenance forward. Supply reads (but
does not write) the Responder Availability Record that Dispatch owns, to
schedule maintenance around callout load.

### The people (Dispatch & Supply)

- **Helen Achebe** — Director of Product, owns the roadmap and
  commitments. Chicago.
- **Marcus Oyelaran** — Engineering Manager, Dispatch. Chicago. Straight
  talker, good first stop when unsure about something.
- **Wen Li** — Staff Engineer, Dispatch, Berlin. Built the routing/ranking
  logic. There's no written doc on how it actually decides who gets
  pinged — she's the source for that.
- **Sofia Marino** — Product Designer, Dispatch (console + phone app).
  Chicago.
- **Nadia Hoffmann** — Support Lead, Dispatch & Supply, Berlin. Sees
  complaint volume before anyone else does.
- **Ravi Menon** — Data Analyst, Dispatch & Supply, Singapore, shared
  across both surfaces (requests go through #data). Owns "the numbers" —
  reports weekly on how often responders are actually answering.
- **Priya Raghunathan** — my predecessor as PM on Dispatch, departed 21
  August 2026 after 14 months as the only PM on Dispatch. Left a
  handover doc.

One thing to flag: the handover doc says "if you need numbers, Marcus
can usually pull something for you," but per the team directory it's
Ravi who owns the numbers and reports on them weekly — worth going to
Ravi directly rather than routing through Marcus.

### Vocabulary

- **Responder** — accepts callouts, goes to incidents. Not a Rook
  employee. Exists in our systems only as capability tags + availability,
  never a legal identity.
- **Handler** — manages a responder or small group: their availability,
  gear, readiness. Usually the one actually clicking around in the
  product.
- **Quartermaster** — owns equipment stock and approvals (Supply-side).
- **Callout** — a request for a responder to attend an incident; the unit
  of work in Dispatch.
- **Callout offer** — a specific callout presented to a specific
  responder, awaiting accept/decline.
- **Callout timeout** — how long an offer stays live before moving on.
  Same for everyone, set per release — currently 60s, cut from 90s in 4.2.
- **Acceptance rate** — share of offers accepted vs. declined/timed out.
  Dispatch's headline metric.
- **Time-to-accept**, **Coverage gap** — secondary Dispatch metrics.
- **Routing priority** — the ranking score: proximity (travel-time),
  availability, capability match, recent acceptance history. Declining or
  timing out lowers your recent-acceptance component and your ranking on
  future callouts.
- **Capability tag** — labeled competency (flight, structural-entry,
  hazmat-tolerant, cold-weather, aquatic, crowd-management,
  de-escalation).
- **Responder Availability Record** — shared record; Dispatch writes it,
  Supply reads it.
- **Mutual aid** — cross-region coverage between responders. Not built
  yet, on the Q4 exploration list.

### Where things stand

4.2 shipped 12 August 2026: rebalanced routing to weight proximity more
heavily relative to recent acceptance history (a long-standing ask from
responders working wide geographies), cut the callout timeout from 90s
to 60s, added console filter persistence, and three defect fixes.

Since the release, callout-related tickets are running roughly 3x normal
— about two-thirds "phone never rings," one-third "offer already gone by
the time I picked up." The second is explained by the shorter timeout;
the first isn't explained yet. Ravi is tracking the split and can pull
rough numbers on actual response rates, though not the real weekly
figures yet.

Priya's read before she left was that this is mostly seasonal — August is
soft every year — and will recover in September. She was explicit that
this was a read, not a checked number, and pushed back against reverting
4.2 on the strength of two weeks of tickets. That seasonality
explanation hasn't actually been checked against Ravi's numbers.

Cross-checking the Q3 roadmap against the actual 4.2 release notes:
"Availability Confidence" (a confidence score alongside a responder's
stated availability, driven by support escalations) was listed as
Committed for 4.2, but it doesn't appear in the 4.2 release notes.
Worth finding out what happened to it.

Also open, per Priya's handover: there's no written description of how
routing decides who gets pinged — that only lives in Wen's head. And
Helen hasn't yet had the conversation about which of the items squeezed
out of 4.2 are still Q3 commitments.

The team agreed to give me a week before regrouping properly on the 4.2
picture.
