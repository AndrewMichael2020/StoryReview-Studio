# StoryReview Studio – Strategic Design Document v1.0

> **Purpose**: A practical strategy for building a fact-anchored literary non-fiction writing tool that minimizes cognitive load while maintaining rigor.

---

## Executive Summary

StoryReview Studio helps authors write 3–5k word literary non-fiction by separating **factual reliability** from **narrative expression**. The core innovation is a **lightweight evidence layer** that tracks what must be true (events, identities, sequences) without burdening the author with spreadsheet-style fact management.

This document proposes:

1. A **streamlined 4-mode workflow** (down from 5)
2. A **typed reliability system** focused on verifiable categories, not confidence scores
3. **Cognitive load reduction** through progressive disclosure and smart defaults
4. A **self-observation framework** for solo testing
5. A **voice preservation system** using author samples and admired pieces

---

## Part 1: Core Philosophy

### 1.1 The Two-Layer Model

| Layer | Description | Control |
|-------|-------------|---------|
| **Expression Layer** | Voice, rhythm, imagery, structure, emotional arc | Subjective – author has full control |
| **Reliability Layer** | Events, identities, sequences, quantities, quotes | Objective – must be verifiable or flagged |

**Key insight**: Reliability applies only to claims about the world, not to how those claims are expressed. The system should never score "thematic depth" or "vividness" – only whether factual claims are grounded.

### 1.2 Design Principles

1. **Progressive disclosure**: Show complexity only when the author needs it
2. **Defaults that protect**: Unverified claims are flagged, not blocked
3. **Patterns over templates**: Learn from examples, don't impose formulas
4. **Observable but not overwhelming**: Every LLM action is logged, but logs are tucked away
5. **Voice is sacred**: Never silently alter the author's style

---

## Part 2: Reliability Type System

### 2.1 What Must Be Reliable

Instead of generic "trust levels," categorize claims by **what kind of truth they assert**:

| Reliability Type | Question Answered | Verification Method | Example |
|------------------|-------------------|---------------------|---------|
| **Event** | Did this happen? | Sources, records, witness accounts | "The factory closed in March 2019" |
| **Identity** | Does this person/place/org exist? | Public records, web presence | "Maria Gonzalez, the union organizer" |
| **Sequence** | Did A happen before/after B? | Timeline cross-reference | "She was fired two weeks before the vote" |
| **Quantity** | Is this number accurate? | Data sources, official records | "The town lost 400 jobs" |
| **Attribution** | Did X actually say this? | Recording, transcript, notes | "She told me, 'They knew all along'" |
| **Characterization** | Is this description fair/accurate? | Multiple sources, subject response | "He was known as a ruthless negotiator" |

### 2.2 Reliability States (Not Scores)

Replace 1–10 scores with clear states:

| State | Symbol | Meaning |
|-------|--------|---------|
| Verified | ✓ | 2+ independent sources OR primary document |
| Sourced | ◐ | 1 source (named or documented) |
| Claimed | ○ | Author asserts based on memory/interview, no doc |
| Unknown | ? | Claim made in draft but not yet linked to evidence |
| Contested | ⚠ | Sources disagree – conflict documented |
| Unfounded | ∅ | Checked and no supporting evidence found |

**Fluidity principle**: States can change as the author works. A claim might start as "Unknown," become "Sourced" when the author links a note, then upgrade to "Verified" when a second source is added. The system tracks this evolution without locking anything.

### 2.3 Evidence Bundles (Not Atomic Claims)

To reduce cognitive load, group related claims into **evidence bundles**:

**Example Bundle: Factory Closure**

| Claim | Type | State | Source |
|-------|------|-------|--------|
| Factory closed | Event | ✓ Verified | News article 3/15/19, County records |
| Closure announced 2 weeks after union vote | Sequence | ◐ Sourced | Interview with Maria G. |
| 400 jobs lost | Quantity | ? Unknown | Need to verify |
| "Sudden" closure | Characterization | ○ Claimed | Author note: Multiple interviewees used this word |

**Author workflow**: Work at the bundle level. Drill into individual claims only when the system flags an issue or when preparing for publication.

---

## Part 3: Streamlined Workflow (4 Modes)

### 3.1 Mode Overview

```
SEED → SHAPE → DRAFT → TEST
```

| Mode | Purpose |
|------|---------|
| **SEED** | Idea + Research plan |
| **SHAPE** | Evidence bundles + Structure |
| **DRAFT** | Write + Track grounding |
| **TEST** | Stress test the piece |

**Key change from original spec**: Merged "Idea" and "Facts" into a single "Seed" mode, and merged "Structure" exploration into "Shape." This reduces mode-switching friction.

---

### 3.2 Mode 1: SEED

**Purpose**: Capture the idea, identify what must be verified, and plan research.

#### Key Features

1. **Guided Q&A**: The assistant asks targeted questions to surface:
   - What the author knows vs. assumes
   - What must be verified for the piece to work
   - Potential sensitivity areas

2. **Unknowns List**: Auto-generated from Q&A, editable by author. These become the research checklist.

3. **Research Sources**: Suggested source types based on the story's needs. The author checks off what they have or plan to get.

#### Output

- **Story Intent Card**: Title, length, tone, sensitivity flags
- **Unknowns Checklist**: What must be resolved before publication
- **Source Plan**: What evidence the author will gather

#### UI Components

| Panel | Contents |
|-------|----------|
| **Left** | Free text area for story idea (2-3 paragraphs) |
| **Right Top** | Story Intent: Working title, target length, tone |
| **Right Middle** | Unknowns to Resolve checklist |
| **Right Bottom** | Research Sources checklist |
| **Bottom Left** | Assistant Q&A conversation |

---

### 3.3 Mode 2: SHAPE

**Purpose**: Build evidence bundles from sources and discover the story's structure through exploration, not templates.

#### Key Features

1. **Evidence Bundles Panel**:
   - Add sources (paste URL, upload PDF, paste notes)
   - System extracts claims and groups into bundles
   - Author can rename, merge, split bundles
   - Reliability states shown at bundle level (worst state bubbles up)

2. **Structure Canvas**:
   - Freeform scene cards (author creates, names, orders)
   - Drag bundles onto scenes to indicate "this evidence supports this scene"
   - Word count targets per scene (optional)
   - No forced roles – author describes each scene's function in their own words

3. **Pattern References** (not templates):
   - System suggests published pieces with similar structures
   - Author can view how those pieces were organized
   - These are references, not constraints

4. **Health Checks** (not scores):
   - Flags potential issues: unused bundles, scenes with no evidence, unresolved unknowns
   - Suggestions, not requirements

#### Voice & Style Samples

Collapsible section at bottom:

- **Your voice sample**: Paste 300-500 words of your own writing you're proud of
- **Admired pieces**: Add pieces with notes on what you admire (structure, pacing, voice, argument)

These samples help the system preserve your voice during edits and suggest structural approaches that match your aspirations.

---

### 3.4 Mode 3: DRAFT

**Purpose**: Write the story with live reliability tracking and voice-aware assistance.

#### Key Features

1. **Structure Panel** (left):
   - Scene list with reliability indicators (● = verified claims, ○ = unverified)
   - Word count progress
   - Quick view of bundle usage and unknowns resolved

2. **Manuscript Editor** (center):
   - Clean writing surface – no inline underlines by default
   - Hover on a sentence to see its evidence trail
   - Claim detection runs in background, doesn't interrupt flow

3. **Evidence Trail Panel** (right):
   - Shows reliability state of claims in current paragraph
   - One-click to link evidence or add hedging language
   - Surfaces suggestions without blocking

#### Assistance Actions (triggered by author, never automatic)

**Light Touch** (preserves all claims and structure):
- Tighten this paragraph
- Clarify this sentence
- Add hedging for unverified claim

**Structural** (may reorganize):
- Suggest a better opening for this scene
- Propose transition to next scene

**Rebuild** (shows full diff for approval):
- Rewrite this scene using structure + evidence
- Compress this section to [target] words

**Safeguards**:
- ☑ Check rewrites against my voice sample
- ☑ Never add claims not in evidence bundles

#### Voice Preservation

When any rewrite is generated:

1. System compares output to author's voice sample
2. If significant drift detected, warns: "This rewrite is more formal/informal than your usual style"
3. Author can: Accept, Reject, or "Rewrite again, closer to my voice"

---

### 3.5 Mode 4: TEST

**Purpose**: Stress-test the piece for reliability, structure, and potential challenges.

#### Test Types

| Test | What It Does |
|------|--------------|
| **Full Review** | Complete reliability + structure assessment |
| **Red Team** | Adversarial analysis |
| **Fact Check** | Focus on claim verification |

#### Reliability Report

Type-by-type breakdown of claim states. Not scores – counts and specific flags.

**Example output**:

> **Events & Sequences**
> ✓ 8 verified · ◐ 3 single-source · ? 2 unlinked · ⚠ 1 contested
>
> ⚠ "The closure was announced two weeks after the vote"
> - Source A (Maria): "about two weeks"
> - Source B (news): "March 15" (vote was Feb 28 = 15 days)
> - → Consider: reconcile or acknowledge ambiguity

#### Red Team Report

Adversarial analysis asking:

**If a hostile fact-checker reviewed this piece:**
- "The claim that management 'knew all along' rests on a single source (Maria) who has obvious motive. A skeptic would ask: any corroborating documents?"

**If the story's subject responded:**
- "They would likely dispute the characterization of the closure as 'sudden' – the news article mentions a 90-day WARN Act notice was filed."

#### Structural Observations

Non-scored observations about pacing, setup/payoff, scene function:

- "The core event (Maria's last day) is told, not shown. No scene puts the reader in the moment."
- "The ending introduces new information (the lawsuit) that wasn't set up earlier."

#### Priority Fixes

**If you do only three things:**

1. Verify or hedge "seventeen years" → Go to ¶3
2. Add source for "400 jobs" or remove → Go to ¶7
3. Address the "sudden" characterization given WARN notice → Go to ¶12

**No automatic edits** – this is a report the author uses to guide their own revisions.

---

## Part 4: Cognitive Load Reduction Strategies

### 4.1 Progressive Disclosure

| Level | What's Visible | When |
|-------|----------------|------|
| **Surface** | Scene list, word counts, overall reliability indicator | Always |
| **Working** | Evidence bundles, current paragraph's claims | When in relevant mode |
| **Deep** | Individual claims, source documents, full provenance chain | On author's explicit request |

### 4.2 Smart Defaults

- New sources → auto-extract claims into bundles (author can edit)
- New claims in draft → auto-detect and flag for linking (not block)
- Reliability states → inherit from strongest linked evidence (upgradeable)

### 4.3 Keyboard-First Workflow

| Shortcut | Action |
|----------|--------|
| `Cmd/Ctrl + E` | Open evidence trail for current paragraph |
| `Cmd/Ctrl + L` | Link selected text to evidence |
| `Cmd/Ctrl + H` | Add hedging to selected claim |
| `Cmd/Ctrl + T` | Run quick reliability check on current scene |
| `Cmd/Ctrl + R` | Open assistance menu |

### 4.4 Minimal UI States

The interface has only three "loudness" levels:

1. **Quiet**: Everything verified or author has dismissed warnings
2. **Attentive**: Unlinked claims exist – subtle indicator, no interruption
3. **Alert**: Contested claims or critical unknowns – visible but not modal

---

## Part 5: Self-Observation Framework

Since you're testing solo, here's a structured approach to observing your own usage.

### 5.1 Session Logging

Build in automatic logging of:

- Session duration and mode time distribution
- Actions taken (added source, used assistance, linked evidence, etc.)
- Friction markers (repeated actions, long pauses, mode bouncing)

### 5.2 Friction Indicators (Auto-Detected)

| Indicator | Signal |
|-----------|--------|
| **Repeated actions** | Clicking the same thing multiple times → UI unclear |
| **Long pauses** | No action for 60+ seconds → confusion or thinking? |
| **Mode bouncing** | Switching between modes rapidly → workflow doesn't match mental model |
| **Dismissed suggestions** | High dismiss rate → suggestions not useful |
| **Abandoned features** | Opened but never used → unnecessary complexity |

### 5.3 Post-Session Reflection Prompt

After each session, the app prompts:

- What felt smooth today?
- Where did you feel friction or confusion?
- What did you want to do that you couldn't?

### 5.4 Weekly Review Dashboard

Aggregate your own data:

- Sessions count and total time
- Mode distribution (bar chart)
- Top friction points
- Features never used
- Your notes from reflections

---

## Part 6: Technical Architecture (Sketch)

### 6.1 Data Model

**Story**
- id, title, intent, voice_sample, admired_pieces
- bundles (EvidenceBundle[])
- scenes (Scene[])
- manuscript (Manuscript)
- reviews (ReviewReport[])
- sessions (SessionLog[])

**EvidenceBundle**
- id, name, claims (Claim[]), sources (Source[])

**Claim**
- id, text
- type: event | identity | sequence | quantity | attribution | characterization
- state: verified | sourced | claimed | unknown | contested | unfounded
- sources (SourceLink[])
- author_notes
- used_in_scenes (string[])

**Scene**
- id, title, description (author's words)
- target_word_count
- bundles (bundle IDs)
- order

### 6.2 LLM Usage Strategy

| Task | Model Class | Context Needed | Frequency |
|------|-------------|----------------|-----------|
| Q&A in SEED mode | Small (4o-mini) | Idea text + conversation | Per question |
| Claim extraction | Small | Source text only | Per source added |
| Bundle organization | Small | All claims in story | On demand |
| Pattern matching | Medium | Story intent + scene list | On demand |
| Paragraph assistance | Medium | Paragraph + context + voice sample | Per request |
| Scene rebuild | Large (Opus/Gemini Pro) | Full story + scene + bundles + voice | Per request |
| Full review | Large | Full story + all bundles + intent + voice | Per request |
| Red team analysis | Large | Full story + all bundles | Per request |

### 6.3 Cost Estimation (Per Story)

Assuming a 4,000-word piece with typical usage:

| Action | Estimated Cost |
|--------|----------------|
| SEED Q&A (10 questions) | $0.05 |
| Source processing (5 sources) | $0.10 |
| Paragraph assistance (20 requests) | $0.50 |
| Scene rebuilds (2 requests) | $1.00 |
| Full review (2 runs) | $2.00 |
| Red team (1 run) | $1.00 |
| **Total per story** | **~$4.65** |

---

## Part 7: Development Roadmap

### Phase 1: Core Writing Loop (4-6 weeks)

**Goal**: Usable DRAFT mode with basic evidence tracking

- Manuscript editor with scene structure
- Basic evidence bundles (manual entry only)
- Claim detection in draft (highlight unlinked claims)
- Simple linking UI
- Session logging for self-observation

**Test with**: One real story you're working on

### Phase 2: Evidence Layer (4-6 weeks)

**Goal**: Full SEED and SHAPE modes

- Guided Q&A in SEED
- Source ingestion (URL, paste, upload)
- Automatic claim extraction
- Evidence bundle management
- Structure canvas with drag-and-drop

**Test with**: Starting a new story from scratch

### Phase 3: Review System (3-4 weeks)

**Goal**: Full TEST mode

- Reliability report generation
- Red team analysis
- Priority fix list with navigation
- Voice sample integration

**Test with**: Completing a story end-to-end

### Phase 4: Polish & Voice (3-4 weeks)

**Goal**: Voice preservation and UX refinement

- Voice sample comparison for rewrites
- Admired pieces reference
- Keyboard shortcuts
- Friction point fixes based on self-observation data

---

## Part 8: Open Questions for Testing

As you build and test, track your answers to:

1. **Bundle granularity**: How many bundles feel manageable? (Hypothesis: 5-8 per story)

2. **Claim detection accuracy**: How often does auto-detection miss claims or flag non-claims?

3. **Voice drift**: Can you feel when a rewrite doesn't sound like you? Is the warning helpful?

4. **Mode sequence**: Do you actually move SEED → SHAPE → DRAFT → TEST, or do you jump around?

5. **Red team usefulness**: Does adversarial analysis surface things you hadn't considered?

6. **Reliability states**: Are 6 states too many? Would 4 (verified / sourced / unlinked / contested) be enough?

7. **Session length**: How long before fatigue? Does the UI contribute to fatigue?

---

## Appendix A: Example Evidence Bundle (YAML)

```yaml
bundle:
  name: "Factory Closure Event"
  
  claims:
    - text: "Millbrook Electronics factory closed permanently"
      type: event
      state: verified
      sources:
        - type: news_article
          title: "Millbrook Electronics Shutters After 45 Years"
          publication: "County Herald"
          date: 2019-03-16
          relevant_quote: "The plant's doors closed for the final time Friday..."
        - type: public_record
          title: "WARN Act Notice"
          agency: "State Dept. of Labor"
          date: 2018-12-15
          
    - text: "400 workers lost jobs"
      type: quantity
      state: sourced
      sources:
        - type: news_article
          relevant_quote: "...affecting approximately 400 workers"
      author_note: "Need to verify against WARN notice"
      
    - text: "Closure was announced two weeks after union vote"
      type: sequence  
      state: contested
      sources:
        - type: interview
          subject: "Maria Gonzalez"
          date: 2024-01-10
          relevant_quote: "It was about two weeks after we voted"
        - type: news_article
          relevant_quote: "...the February 28 election..."
      author_note: "15 days vs 'two weeks' - decide on phrasing"
```

---

## Appendix B: Example Session Log (YAML)

```yaml
session:
  id: "2024-01-15-afternoon"
  story: "Maria and the Factory"
  duration_minutes: 75
  
  mode_time:
    SEED: 0
    SHAPE: 12
    DRAFT: 58
    TEST: 5
    
  friction_markers:
    - type: "repeated_action"
      action: "link_evidence"
      count: 4
      note: "Kept clicking wrong thing"
      
    - type: "long_pause"
      duration_seconds: 180
      context: "Stuck on transition"
      
  post_session_reflection:
    smooth: "Writing in scene 2 flowed well"
    friction: "Linking evidence is too many clicks"
    wanted: "Timeline view of all dated events"
```

---

*Document version: 1.0*  
*Created: 2025-11-24*  
*For: Solo development and testing of StoryReview Studio*