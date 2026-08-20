# Module 2 · Super Hearing — worked solution

This file is generated output, not hand-written. It's the result of running
the two content-test prompts below against
[`00-rook/feedback/interviews/`](../00-rook/feedback/interviews/) and
[`00-rook/feedback/tickets/`](../00-rook/feedback/tickets/) once those
folders were built.

---

## Prompt 1

> Read everything in `00-rook/feedback/interviews/`. These are four
> conversations with the people who run the console for our responders.
> Tell me what they're unhappy about — group it, tell me how many of the
> four raised each thing, and quote one line for each so I can hear how
> they actually said it.

### Output

# Complaints/Pain Points Across the Four Interviews

**1. Callouts going to another responder before theirs could respond in time — 3 of 4 (Ambrose, Dot, Halloran)**
> "Two weeks ago the young master was halfway into the suit — coat on, one boot on — when it went to somebody else." — Ambrose

**2. Status text too small to read at a glance — 2 of 4 (Ambrose, Dot)**
> "Larger text on the status badge. My eyes aren't what they were, and at a glance I sometimes cannot tell engaged from available without leaning in." — Ambrose

**3. Wildly uneven callout volume between responders/weeks, with no visibility into why — 2 of 4 (Dot, Kip)**
> "Meteor Mite's been texting me all week asking if something's broken because it's so quiet... And The Gale hasn't stopped, like, at all, same week, same city. I don't know what to tell either of them." — Kip

**4. No dark mode / display too bright for night use — 1 of 4 (Kip)**
> "dark mode. I am begging. It's 11pm, I've got two other screens dimmed down, and the console is just this wall of white light in the middle of my face." — Kip

**5. Filters didn't persist between sessions (before the August fix), and persistence now feels unreliable — 1 of 4 (Ambrose)**
> "Until this month, yes, every single time, which I raised more than once." — Ambrose
> "Twice now it's reverted to the default view after what I assume was some manner of update on your end, and I didn't notice until I'd been looking at the wrong filter for a quarter of an hour." — Ambrose

**6. Handler isn't notified directly — only the responder's phone buzzes — 1 of 4 (Dot)**
> "maybe something that tells me too, not just him, when something's come in, so I'm not relying on hearing a buzz through a ceiling." — Dot

**7. Same alert sound for different responders makes it hard to tell who got the callout — 1 of 4 (Kip)**
> "I want the alert sound to be different for each of them, because right now Mite and Gale both just go 'bing' and I have to actually look to know which one." — Kip

**8. Capability tag legend hard to find/reach — 1 of 4 (Ambrose)**
> "The capability tag legend. It sits in a drawer off the responder detail panel and I open it perhaps once a fortnight, when a new tag appears and I don't recognize it." — Ambrose

**9. Requisition approvals too slow, with no way to prioritize urgent items — 1 of 4 (Halloran)**
> "There's a priority field. I set it. Doesn't seem to change anything about how fast it actually moves, it just sits in the same queue as somebody ordering a spare set of boot laces." — Halloran

**10. Field failure reports get no response or visible follow-up — 1 of 4 (Halloran)**
> "I file a failure report and it goes into a void. I don't know if anyone reads it, I don't know if it changed anything, I just know the item's history shows the report and that's it." — Halloran

**11. Equipment catalog search returns poor/irrelevant results — 1 of 4 (Halloran)**
> "The equipment catalog search is bad. If I don't know the exact item name I'm not finding it... got forty results, half of them unrelated, and had to scroll." — Halloran

---

## Prompt 2

> Read everything in `00-rook/feedback/tickets/`. Same treatment as before:
> group them, tell me how many are in each group, quote one from each. Then
> tell me what showed up after 12 August that wasn't there before.

### Output

## Grouped by kind of problem reported

**1. No callouts arriving / extended dry spell — 16 tickets**
T-002, T-004, T-005, T-006, T-008, T-009, T-010, T-012, T-013, T-014, T-016, T-017, T-018, T-021, T-022, T-024

Representative quote (T-006): *"nothing all week?? is this thing broken"*

**2. Callout arrived but vanished/reassigned before the responder could accept it — 7 tickets**
T-001, T-003, T-007, T-011, T-015, T-019, T-023

Representative quote (T-007): *"phone buzzed, by the time i unlocked it, gone. second time this week"*

**3. Both reported together in one ticket — a long dry spell ending in a callout that was immediately lost — 2 tickets**
T-020, T-025

Representative quote (T-020): *"Cindermark has been quiet for about ten days now with only one callout in that window, and that one he lost before he could respond"*

(16 + 7 + 2 = 25)

## What shows up after 12 August 2026

Every ticket in the set (T-001 through T-025) is dated 13 August 2026 or later — the earliest ticket, T-001, is dated 13 August, one day after that boundary. There are no tickets dated on or before 12 August in this set.

12 August is also named explicitly inside the tickets themselves: T-008 (filed 21 August) states Ironvale "had no callouts since the 12th."

Volume/timing across the date range:
- 13–19 August: 5 tickets, one every one to three days (T-001 through T-005).
- 20 August onward: filing frequency increases, with multiple tickets landing on the same day — two on 20 August (T-006, T-007), two on 27 August (T-014, T-015), and two on 3 September (T-022, T-023).
- The "combined" ticket type (dry spell immediately followed by a lost callout, reported as one ticket) does not appear until T-011 (24 August) and T-019 (31 August) — where the filer explicitly notes it as a *separate* ticket from an earlier dry-spell report — followed by T-020 (1 September) and T-025 (5 September), where the filer explicitly logs the dry spell and the lost callout together in a single ticket ("Logging both parts here" / "Raising both parts together").
- Responder-filed (mobile) tickets — as opposed to handler-filed ones — first appear on 17 August (T-003) and then recur repeatedly through the rest of the set (T-003, T-006, T-007, T-009, T-013, T-015, T-017, T-021, T-023, T-024), 10 of the 25 tickets total.

---

## Pass check

- **Interviews:** loud about pings vanishing — 3 of 4 interviewees (Ambrose, Dot, Halloran) raised it unprompted, each with a distinct, vivid account. Pass.
- **Tickets:** roughly two-to-one the other way — counting the two combined-type tickets on each side, that's 18 "no ping" (16 + 2) to 9 "vanished ping" (7 + 2), a 2:1 split. Pass.
