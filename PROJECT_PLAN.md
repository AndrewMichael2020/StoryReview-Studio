# StoryReview Studio - POC Project Plan

> **Purpose**: This document provides a comprehensive, manageable implementation plan for the StoryReview Studio POC. Each section can be translated into GitHub Project issues and milestones.
> 
> **Based on**: StoryReview_Studio_Strategy_v1_Version2 (2).md

---

## Overview

StoryReview Studio is a fact-anchored literary non-fiction writing tool that separates **factual reliability** from **narrative expression**. The POC will implement a **4-mode workflow** (SEED → SHAPE → DRAFT → TEST) with a **typed reliability system**.

---

## Milestones (GitHub Project Columns)

| Milestone | Duration | Goal |
|-----------|----------|------|
| **M0: Project Setup** | 1 week | Development environment and foundation |
| **M1: Core Writing Loop** | 4-6 weeks | Usable DRAFT mode with basic evidence tracking |
| **M2: Evidence Layer** | 4-6 weeks | Full SEED and SHAPE modes |
| **M3: Review System** | 3-4 weeks | Full TEST mode |
| **M4: Polish & Voice** | 3-4 weeks | Voice preservation and UX refinement |

---

## M0: Project Setup

### Epic: Development Foundation

#### Issue 1: Initialize Project Repository
**Type**: Task  
**Priority**: High  
**Labels**: `setup`, `infrastructure`  
**Description**:
Set up the project with proper structure and tooling.

**Acceptance Criteria**:
- [ ] Initialize frontend framework (React/Next.js recommended)
- [ ] Set up TypeScript configuration
- [ ] Configure ESLint and Prettier
- [ ] Set up testing framework (Jest + React Testing Library)
- [ ] Create basic folder structure
- [ ] Add README with project overview

---

#### Issue 2: Define Data Models
**Type**: Task  
**Priority**: High  
**Labels**: `backend`, `data-model`  
**Description**:
Implement the core data models as defined in Part 6.1 of the strategy document.

**Acceptance Criteria**:
- [ ] Story model (id, title, intent, voice_sample, admired_pieces)
- [ ] EvidenceBundle model (id, name, claims, sources)
- [ ] Claim model with types (event, identity, sequence, quantity, attribution, characterization)
- [ ] Claim states (verified, sourced, claimed, unknown, contested, unfounded)
- [ ] Scene model (id, title, description, target_word_count, bundles, order)
- [ ] Source model and SourceLink
- [ ] ReviewReport model
- [ ] SessionLog model for self-observation

**Reference Code (TypeScript)**:
```typescript
// Types for claims
type ClaimType = 'event' | 'identity' | 'sequence' | 'quantity' | 'attribution' | 'characterization';
type ClaimState = 'verified' | 'sourced' | 'claimed' | 'unknown' | 'contested' | 'unfounded';

interface Claim {
  id: string;
  text: string;
  type: ClaimType;
  state: ClaimState;
  sources: SourceLink[];
  authorNotes?: string;
  usedInScenes: string[];
}
```

---

#### Issue 3: Set Up State Management
**Type**: Task  
**Priority**: High  
**Labels**: `frontend`, `state`  
**Description**:
Implement state management for the application.

**Acceptance Criteria**:
- [ ] Choose state management solution (Zustand/Redux Toolkit recommended)
- [ ] Create stores for Story, Bundles, Scenes, and Sessions
- [ ] Implement persistence layer (localStorage initially, IndexedDB later)
- [ ] Add undo/redo capability for editing actions

---

#### Issue 4: Design System & UI Components
**Type**: Task  
**Priority**: Medium  
**Labels**: `frontend`, `design`  
**Description**:
Create the foundational UI components and design tokens.

**Acceptance Criteria**:
- [ ] Set up component library (shadcn/ui or similar)
- [ ] Define color palette (including reliability state indicators)
- [ ] Create reliability state icons: ✓ (verified), ◐ (sourced), ○ (claimed), ? (unknown), ⚠ (contested), ∅ (unfounded)
- [ ] Implement 3 UI loudness levels (Quiet, Attentive, Alert)
- [ ] Create reusable Panel components for the layout

---

## M1: Core Writing Loop (Phase 1)

### Epic: DRAFT Mode Implementation

#### Issue 5: Manuscript Editor Foundation
**Type**: Feature  
**Priority**: High  
**Labels**: `draft-mode`, `editor`  
**Description**:
Build the core manuscript editor for writing.

**Acceptance Criteria**:
- [ ] Rich text editor with basic formatting (bold, italic, headers)
- [ ] Scene-based document structure
- [ ] Auto-save functionality
- [ ] Clean writing surface (no inline underlines by default)
- [ ] Word count display per scene and total

---

#### Issue 6: Scene Structure Panel
**Type**: Feature  
**Priority**: High  
**Labels**: `draft-mode`, `navigation`  
**Description**:
Implement the left panel showing scene structure.

**Acceptance Criteria**:
- [ ] Scene list with drag-and-drop reordering
- [ ] Reliability indicators per scene (● = verified, ○ = unverified)
- [ ] Word count progress per scene
- [ ] Quick navigation between scenes
- [ ] Add/delete/rename scene functionality

---

#### Issue 7: Basic Evidence Bundle UI
**Type**: Feature  
**Priority**: High  
**Labels**: `draft-mode`, `evidence`  
**Description**:
Create manual evidence bundle management for DRAFT mode.

**Acceptance Criteria**:
- [ ] Create/edit/delete evidence bundles
- [ ] Add claims manually to bundles
- [ ] Set claim type and state
- [ ] Add author notes to claims
- [ ] Bundle summary showing worst reliability state

---

#### Issue 8: Claim Detection in Draft
**Type**: Feature  
**Priority**: Medium  
**Labels**: `draft-mode`, `ai`  
**Description**:
Implement background claim detection while writing.

**Acceptance Criteria**:
- [ ] Detect potential claims in text (events, quantities, attributions)
- [ ] Highlight unlinked claims on hover (not by default)
- [ ] Non-blocking, runs in background
- [ ] Flag potential claims for review without interrupting flow

---

#### Issue 9: Evidence Linking UI
**Type**: Feature  
**Priority**: Medium  
**Labels**: `draft-mode`, `evidence`  
**Description**:
Allow linking text to evidence bundles.

**Acceptance Criteria**:
- [ ] Select text and link to existing claim
- [ ] Create new claim from selected text
- [ ] Show evidence trail on paragraph hover
- [ ] One-click evidence linking
- [ ] Keyboard shortcut: Cmd/Ctrl + L

---

#### Issue 10: Evidence Trail Panel
**Type**: Feature  
**Priority**: Medium  
**Labels**: `draft-mode`, `ui`  
**Description**:
Implement the right panel showing evidence for current paragraph.

**Acceptance Criteria**:
- [ ] Shows reliability state of claims in current paragraph
- [ ] One-click to link evidence
- [ ] Option to add hedging language
- [ ] Non-blocking suggestions

---

#### Issue 11: Session Logging for Self-Observation
**Type**: Feature  
**Priority**: Medium  
**Labels**: `analytics`, `self-observation`  
**Description**:
Implement automatic session logging as per Part 5.

**Acceptance Criteria**:
- [ ] Log session duration and mode time distribution
- [ ] Track actions (added source, linked evidence, etc.)
- [ ] Detect friction markers (repeated actions, long pauses, mode bouncing)
- [ ] Store session logs in SessionLog model

---

## M2: Evidence Layer (Phase 2)

### Epic: SEED Mode Implementation

#### Issue 12: SEED Mode UI Layout
**Type**: Feature  
**Priority**: High  
**Labels**: `seed-mode`, `ui`  
**Description**:
Build the SEED mode interface.

**Acceptance Criteria**:
- [ ] Left panel: Free text area for story idea (2-3 paragraphs)
- [ ] Right top: Story Intent Card (working title, target length, tone)
- [ ] Right middle: Unknowns to Resolve checklist
- [ ] Right bottom: Research Sources checklist
- [ ] Bottom left: Assistant Q&A conversation

---

#### Issue 13: Guided Q&A System
**Type**: Feature  
**Priority**: High  
**Labels**: `seed-mode`, `ai`  
**Description**:
Implement the AI-guided Q&A to surface story requirements.

**Acceptance Criteria**:
- [ ] Targeted questions to identify what author knows vs assumes
- [ ] Surface what must be verified for the piece to work
- [ ] Identify potential sensitivity areas
- [ ] Use small model (4o-mini) for efficiency
- [ ] Conversational interface

---

#### Issue 14: Unknowns List Generation
**Type**: Feature  
**Priority**: Medium  
**Labels**: `seed-mode`, `ai`  
**Description**:
Auto-generate and manage the unknowns checklist.

**Acceptance Criteria**:
- [ ] Auto-generate from Q&A conversation
- [ ] Editable by author
- [ ] Check-off functionality
- [ ] Becomes research checklist

---

#### Issue 15: Story Intent Card
**Type**: Feature  
**Priority**: Medium  
**Labels**: `seed-mode`, `ui`  
**Description**:
Implement the story metadata capture.

**Acceptance Criteria**:
- [ ] Working title field
- [ ] Target length selector
- [ ] Tone/style selector
- [ ] Sensitivity flags (checkboxes)
- [ ] Persist with story

---

### Epic: SHAPE Mode Implementation

#### Issue 16: SHAPE Mode UI Layout
**Type**: Feature  
**Priority**: High  
**Labels**: `shape-mode`, `ui`  
**Description**:
Build the SHAPE mode interface with two main areas.

**Acceptance Criteria**:
- [ ] Evidence Bundles Panel
- [ ] Structure Canvas for scene cards
- [ ] Drag-and-drop between panels
- [ ] Collapsible voice & style samples section

---

#### Issue 17: Source Ingestion
**Type**: Feature  
**Priority**: High  
**Labels**: `shape-mode`, `sources`  
**Description**:
Implement source import functionality.

**Acceptance Criteria**:
- [ ] Paste URL and extract content
- [ ] Upload PDF and extract text
- [ ] Paste notes directly
- [ ] Store source metadata (type, title, date, publication)

---

#### Issue 18: Automatic Claim Extraction
**Type**: Feature  
**Priority**: High  
**Labels**: `shape-mode`, `ai`  
**Description**:
Use AI to extract claims from sources.

**Acceptance Criteria**:
- [ ] Extract claims from source text
- [ ] Categorize claim types automatically
- [ ] Group claims into suggested bundles
- [ ] Use small model for efficiency
- [ ] Allow author editing of extracted claims

---

#### Issue 19: Evidence Bundle Management
**Type**: Feature  
**Priority**: Medium  
**Labels**: `shape-mode`, `evidence`  
**Description**:
Full bundle management capabilities.

**Acceptance Criteria**:
- [ ] Create, rename, merge, split bundles
- [ ] Reliability states shown at bundle level
- [ ] Worst state bubbles up to bundle indicator
- [ ] Filter and search bundles

---

#### Issue 20: Structure Canvas
**Type**: Feature  
**Priority**: Medium  
**Labels**: `shape-mode`, `structure`  
**Description**:
Implement freeform scene card organization.

**Acceptance Criteria**:
- [ ] Create scene cards with custom names
- [ ] Drag bundles onto scenes
- [ ] Reorder scenes with drag-and-drop
- [ ] Optional word count targets per scene
- [ ] Scene description field (author's own words)

---

#### Issue 21: Pattern References
**Type**: Feature  
**Priority**: Low  
**Labels**: `shape-mode`, `ai`  
**Description**:
Suggest similar published pieces for reference.

**Acceptance Criteria**:
- [ ] Suggest pieces with similar structures
- [ ] Show how reference pieces were organized
- [ ] These are references, not constraints
- [ ] Author can dismiss/save references

---

#### Issue 22: Health Checks
**Type**: Feature  
**Priority**: Medium  
**Labels**: `shape-mode`, `validation`  
**Description**:
Flag potential structural issues.

**Acceptance Criteria**:
- [ ] Flag unused bundles
- [ ] Flag scenes with no evidence
- [ ] Flag unresolved unknowns
- [ ] Suggestions, not requirements
- [ ] Dismissable warnings

---

#### Issue 23: Voice & Style Samples
**Type**: Feature  
**Priority**: Medium  
**Labels**: `shape-mode`, `voice`  
**Description**:
Collect voice samples for preservation.

**Acceptance Criteria**:
- [ ] Input for author's own voice sample (300-500 words)
- [ ] Add admired pieces with notes
- [ ] Notes on what to admire (structure, pacing, voice, argument)
- [ ] Store with story for later use

---

## M3: Review System (Phase 3)

### Epic: TEST Mode Implementation

#### Issue 24: TEST Mode UI Layout
**Type**: Feature  
**Priority**: High  
**Labels**: `test-mode`, `ui`  
**Description**:
Build the TEST mode interface.

**Acceptance Criteria**:
- [ ] Test type selector (Full Review, Red Team, Fact Check)
- [ ] Report display area
- [ ] Priority fixes list with navigation
- [ ] Run test button

---

#### Issue 25: Reliability Report Generation
**Type**: Feature  
**Priority**: High  
**Labels**: `test-mode`, `ai`  
**Description**:
Generate comprehensive reliability reports.

**Acceptance Criteria**:
- [ ] Type-by-type breakdown of claim states
- [ ] Counts per category, not scores
- [ ] Flag specific issues with context
- [ ] Navigate to flagged paragraphs
- [ ] Use large model for comprehensive analysis

**Example Output Format**:
```
**Events & Sequences**
✓ 8 verified · ◐ 3 single-source · ? 2 unlinked · ⚠ 1 contested

⚠ "The closure was announced two weeks after the vote"
- Source A (Maria): "about two weeks"
- Source B (news): "March 15" (vote was Feb 28 = 15 days)
- → Consider: reconcile or acknowledge ambiguity
```

---

#### Issue 26: Red Team Analysis
**Type**: Feature  
**Priority**: Medium  
**Labels**: `test-mode`, `ai`  
**Description**:
Adversarial analysis of the piece.

**Acceptance Criteria**:
- [ ] "If a hostile fact-checker reviewed this piece" analysis
- [ ] "If the story's subject responded" analysis
- [ ] Surface uncorroborated claims
- [ ] Identify potential disputes
- [ ] Use large model for adversarial thinking

---

#### Issue 27: Structural Observations
**Type**: Feature  
**Priority**: Medium  
**Labels**: `test-mode`, `ai`  
**Description**:
Non-scored observations about structure.

**Acceptance Criteria**:
- [ ] Pacing observations
- [ ] Setup/payoff analysis
- [ ] Scene function review
- [ ] Identify telling vs showing
- [ ] Flag new information in endings

---

#### Issue 28: Priority Fixes List
**Type**: Feature  
**Priority**: High  
**Labels**: `test-mode`, `ui`  
**Description**:
Actionable fix suggestions.

**Acceptance Criteria**:
- [ ] "If you do only three things" list
- [ ] Click to navigate to relevant paragraph
- [ ] Track which fixes have been addressed
- [ ] No automatic edits - author control

---

## M4: Polish & Voice (Phase 4)

### Epic: Voice Preservation

#### Issue 29: Voice Sample Comparison
**Type**: Feature  
**Priority**: High  
**Labels**: `voice`, `ai`  
**Description**:
Compare rewrites against author's voice.

**Acceptance Criteria**:
- [ ] Compare AI output to voice sample
- [ ] Detect significant voice drift
- [ ] Warn: "This rewrite is more formal/informal than your usual style"
- [ ] Options: Accept, Reject, "Rewrite again, closer to my voice"

---

#### Issue 30: Assistance Actions in DRAFT
**Type**: Feature  
**Priority**: Medium  
**Labels**: `draft-mode`, `ai`  
**Description**:
Implement author-triggered assistance.

**Acceptance Criteria**:
- [ ] Light Touch: Tighten paragraph, Clarify sentence, Add hedging
- [ ] Structural: Suggest opening, Propose transition
- [ ] Rebuild: Rewrite scene, Compress section (shows full diff)
- [ ] Safeguards: Check against voice sample, Never add claims not in bundles

---

### Epic: UX Refinement

#### Issue 31: Keyboard Shortcuts
**Type**: Feature  
**Priority**: Medium  
**Labels**: `ux`, `keyboard`  
**Description**:
Implement keyboard-first workflow.

**Acceptance Criteria**:
- [ ] Cmd/Ctrl + E: Open evidence trail for current paragraph
- [ ] Cmd/Ctrl + L: Link selected text to evidence
- [ ] Cmd/Ctrl + H: Add hedging to selected claim
- [ ] Cmd/Ctrl + T: Run quick reliability check on current scene
- [ ] Cmd/Ctrl + R: Open assistance menu

---

#### Issue 32: Progressive Disclosure UI
**Type**: Feature  
**Priority**: Medium  
**Labels**: `ux`, `ui`  
**Description**:
Implement information hierarchy.

**Acceptance Criteria**:
- [ ] Surface level: Scene list, word counts, overall reliability (always visible)
- [ ] Working level: Evidence bundles, current paragraph claims (mode-specific)
- [ ] Deep level: Individual claims, source documents (on explicit request)

---

#### Issue 33: Post-Session Reflection
**Type**: Feature  
**Priority**: Low  
**Labels**: `self-observation`, `ui`  
**Description**:
Prompt for reflection after sessions.

**Acceptance Criteria**:
- [ ] Prompt after each session
- [ ] Questions: What felt smooth? Where was friction? What did you want to do?
- [ ] Store with session log

---

#### Issue 34: Weekly Review Dashboard
**Type**: Feature  
**Priority**: Low  
**Labels**: `self-observation`, `analytics`  
**Description**:
Aggregate self-observation data.

**Acceptance Criteria**:
- [ ] Sessions count and total time
- [ ] Mode distribution chart
- [ ] Top friction points
- [ ] Features never used
- [ ] Author notes from reflections

---

#### Issue 35: Friction Point Fixes
**Type**: Task  
**Priority**: Medium  
**Labels**: `ux`, `iteration`  
**Description**:
Address issues identified through self-observation.

**Acceptance Criteria**:
- [ ] Review friction markers from session logs
- [ ] Prioritize based on frequency
- [ ] Implement fixes
- [ ] Verify improvement

---

## Technical Infrastructure Issues

#### Issue 36: LLM Integration Layer
**Type**: Infrastructure  
**Priority**: High  
**Labels**: `backend`, `ai`  
**Description**:
Set up LLM integration with appropriate model selection.

**Acceptance Criteria**:
- [ ] API integration for small model (4o-mini) - Q&A, claim extraction
- [ ] API integration for medium model - pattern matching, paragraph assistance
- [ ] API integration for large model (Opus/Gemini Pro) - reviews, red team
- [ ] Cost tracking per story
- [ ] Error handling and retry logic

---

#### Issue 37: Data Persistence
**Type**: Infrastructure  
**Priority**: High  
**Labels**: `backend`, `storage`  
**Description**:
Implement reliable data storage.

**Acceptance Criteria**:
- [ ] Local storage for POC (IndexedDB)
- [ ] Auto-save every 30 seconds
- [ ] Export story as JSON
- [ ] Import story from JSON
- [ ] Backup/restore functionality

---

#### Issue 38: Mode Navigation
**Type**: Feature  
**Priority**: High  
**Labels**: `frontend`, `navigation`  
**Description**:
Implement seamless mode switching.

**Acceptance Criteria**:
- [ ] Clear mode indicator: SEED → SHAPE → DRAFT → TEST
- [ ] Preserve state when switching modes
- [ ] Track mode time for self-observation
- [ ] Handle incomplete data gracefully

---

## Open Questions Tracking

#### Issue 39: Open Questions Testing Tracker
**Type**: Documentation  
**Priority**: Low  
**Labels**: `testing`, `documentation`  
**Description**:
Track answers to open questions during testing.

**Questions to Track**:
1. Bundle granularity: How many bundles feel manageable? (Hypothesis: 5-8)
2. Claim detection accuracy: Miss rate and false positive rate
3. Voice drift: Can author feel when rewrite doesn't match? Is warning helpful?
4. Mode sequence: Do users follow SEED → SHAPE → DRAFT → TEST or jump?
5. Red team usefulness: Does it surface unconsidered issues?
6. Reliability states: Are 6 states too many? Would 4 suffice?
7. Session length: How long before fatigue? Does UI contribute?

---

## Issue Dependencies (Suggested Order)

### Sprint 1 (Week 1-2)
- Issue 1: Initialize Project Repository
- Issue 2: Define Data Models
- Issue 3: Set Up State Management
- Issue 4: Design System & UI Components

### Sprint 2 (Week 3-4)
- Issue 5: Manuscript Editor Foundation
- Issue 6: Scene Structure Panel
- Issue 7: Basic Evidence Bundle UI
- Issue 38: Mode Navigation

### Sprint 3 (Week 5-6)
- Issue 8: Claim Detection in Draft
- Issue 9: Evidence Linking UI
- Issue 10: Evidence Trail Panel
- Issue 11: Session Logging

### Sprint 4 (Week 7-8)
- Issue 12: SEED Mode UI Layout
- Issue 13: Guided Q&A System
- Issue 14: Unknowns List Generation
- Issue 15: Story Intent Card

### Sprint 5 (Week 9-10)
- Issue 16: SHAPE Mode UI Layout
- Issue 17: Source Ingestion
- Issue 18: Automatic Claim Extraction
- Issue 36: LLM Integration Layer

### Sprint 6 (Week 11-12)
- Issue 19: Evidence Bundle Management
- Issue 20: Structure Canvas
- Issue 22: Health Checks
- Issue 23: Voice & Style Samples

### Sprint 7 (Week 13-14)
- Issue 24: TEST Mode UI Layout
- Issue 25: Reliability Report Generation
- Issue 28: Priority Fixes List
- Issue 37: Data Persistence

### Sprint 8 (Week 15-16)
- Issue 26: Red Team Analysis
- Issue 27: Structural Observations
- Issue 29: Voice Sample Comparison
- Issue 30: Assistance Actions in DRAFT

### Sprint 9 (Week 17-18)
- Issue 31: Keyboard Shortcuts
- Issue 32: Progressive Disclosure UI
- Issue 21: Pattern References
- Issue 33: Post-Session Reflection

### Sprint 10 (Week 19-20)
- Issue 34: Weekly Review Dashboard
- Issue 35: Friction Point Fixes
- Issue 39: Open Questions Testing Tracker

---

## Labels to Create in GitHub Project

| Label | Color | Description |
|-------|-------|-------------|
| `seed-mode` | #0E8A16 | SEED mode features |
| `shape-mode` | #1D76DB | SHAPE mode features |
| `draft-mode` | #5319E7 | DRAFT mode features |
| `test-mode` | #D93F0B | TEST mode features |
| `ai` | #FBCA04 | AI/LLM integration |
| `ui` | #C2E0C6 | User interface |
| `ux` | #BFD4F2 | User experience |
| `evidence` | #F9D0C4 | Evidence system |
| `voice` | #D4C5F9 | Voice preservation |
| `self-observation` | #FEF2C0 | Session logging/analytics |
| `infrastructure` | #B60205 | Technical infrastructure |
| `setup` | #E99695 | Initial setup |

---

## Cost Tracking Reference

Based on strategy document estimates per 4,000-word story:

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

*Plan created: 2025-11-25*  
*Based on: StoryReview_Studio_Strategy_v1_Version2 (2).md*
