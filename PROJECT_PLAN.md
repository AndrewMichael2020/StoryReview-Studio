# StoryReview Studio - Project Plan

> **Purpose**: This document provides a comprehensive, manageable implementation plan for the StoryReview Studio POC. Each section can be translated into GitHub Project issues and milestones.
> 
> **Based on**: StoryReview_Studio_Strategy_Version4.md

---

## Overview

StoryReview Studio is a fact-anchored literary non-fiction writing tool that separates **factual reliability** from **narrative expression**. The POC implements a **4-mode workflow** (SEED → SHAPE → DRAFT → TEST) with a **two-layer model**: a reliability layer for facts and an expression layer for craft.

---

## Milestones (GitHub Project Columns)

| Milestone | Duration | Goal |
|-----------|----------|------|
| **Phase 1: Foundation** | Weeks 1-2 | Project setup, dashboard, SEED mode |
| **Phase 2: Evidence Layer** | Weeks 3-4 | Bundle CRUD, source management, scene structure |
| **Phase 3: Structure Layer** | Weeks 5-6 | Beat definitions, scene-to-beat assignment |
| **Phase 4: Draft Editor** | Weeks 7-8 | Rich text editor, evidence linking, highlighting |
| **Phase 5: Review System** | Weeks 9-10 | LLM integration, review generation |
| **Phase 6: Craft Layer** | Weeks 11-12 | People/character panel, theme tracking, arcs |
| **Phase 7: Polish** | Weeks 13-14 | Assistance actions, keyboard shortcuts, bug fixes |

---

## Phase 1: Foundation (Weeks 1-2)

### Epic: Project Setup & SEED Mode

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
Implement the core data models as defined in Part 6 of the strategy document.

**Acceptance Criteria**:
- [ ] Story model (id, title, premise, targetLength, form, pov, verificationQuestions, status)
- [ ] Bundle model (id, storyId, name, type, state, sources, extracts, claims)
- [ ] Bundle types: event, identity, quantity, attribution, sequence
- [ ] Reliability states: verified, sourced, unlinked, contested
- [ ] Source model (id, bundleId, type, title, date, url, notes)
- [ ] Claim model (id, bundleId, text, sourceIds)
- [ ] Beat model (id, storyId, name, order, description)
- [ ] Scene model (id, storyId, title, beatId, mode, sensoryAnchor, targetWordCount, bundleIds, order)
- [ ] Person model with arc tracking
- [ ] Theme model
- [ ] Manuscript and ManuscriptScene models
- [ ] EvidenceLink model with isInterpretation flag
- [ ] ReviewReport model

**Reference Code (TypeScript)**:
```typescript
// === STORY ===
interface Story {
  id: string;
  title: string;
  premise: string;
  targetLength?: number;
  form: 'reported' | 'personal' | 'hybrid' | 'other';
  pov: 'first' | 'third-limited' | 'third-omniscient' | 'braided';
  verificationQuestions: string[];
  status: 'seed' | 'shape' | 'draft' | 'ready-to-test' | 'complete';
  createdAt: Date;
  updatedAt: Date;
}

// === EVIDENCE ===
interface Bundle {
  id: string;
  storyId: string;
  name: string;
  type: 'event' | 'identity' | 'quantity' | 'attribution' | 'sequence';
  state: 'verified' | 'sourced' | 'unlinked' | 'contested';
  sources: Source[];
  extracts: string[];
  claims: Claim[];
}

interface Source {
  id: string;
  bundleId: string;
  type: 'web' | 'document' | 'interview' | 'personal' | 'other';
  title: string;
  date?: string;
  url?: string;
  notes?: string;
}

interface Claim {
  id: string;
  bundleId: string;
  text: string;
  sourceIds: string[];
}

// === STRUCTURE ===
interface Beat {
  id: string;
  storyId: string;
  name: string;
  order: number;
  description?: string;
}

interface Scene {
  id: string;
  storyId: string;
  title: string;
  beatId?: string;
  mode?: 'showing' | 'telling' | 'mixed';
  sensoryAnchor?: string;
  targetWordCount?: number;
  bundleIds: string[];
  order: number;
}

// === CRAFT ===
interface Person {
  id: string;
  storyId: string;
  name: string;
  role: 'protagonist' | 'subject' | 'witness' | 'expert' | 'antagonist' | string;
  appearsIn: string[];
  arc?: {
    startingState: string;
    endingState: string;
    turningPoint?: string;
  };
  characterizingDetails: string[];
  speechPatterns?: string;
  sourceReliability?: 'verified' | 'sourced' | 'unlinked' | 'contested';
  linkedBundleId?: string;
}

interface Theme {
  id: string;
  storyId: string;
  name: string;
  description?: string;
  appearsIn: string[];
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
- [ ] Create stores for Story, Bundles, Scenes, Beats, Persons, and Themes
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
- [ ] Create reliability state icons with accessible alternatives:
  - ✓ (verified) - aria-label: "Verified: 2+ independent sources"
  - ◐ (sourced) - aria-label: "Sourced: 1 documented source"
  - ? (unlinked) - aria-label: "Unlinked: Claim exists but no source attached"
  - ⚠ (contested) - aria-label: "Contested: Sources disagree"
- [ ] Implement 3 UI loudness levels (Quiet, Attentive, Alert)
- [ ] Create reusable Panel components for the layout

---

#### Issue 5: Dashboard with Story Management
**Type**: Feature  
**Priority**: High  
**Labels**: `frontend`, `ui`  
**Description**:
Build the main dashboard for managing stories.

**Acceptance Criteria**:
- [ ] Story list view
- [ ] Create new story
- [ ] Open existing story
- [ ] Delete story
- [ ] Story status indicators

---

#### Issue 6: SEED Mode Intent Form
**Type**: Feature  
**Priority**: High  
**Labels**: `seed-mode`, `ui`  
**Description**:
Build the SEED mode interface for capturing story intent.

**Acceptance Criteria**:
- [ ] Title field (required)
- [ ] Premise field (1-3 sentences, required)
- [ ] Target length selector (optional - advisory only)
- [ ] Form selector (Reported / Personal essay / Hybrid / Other)
- [ ] POV selector (First / Third limited / Third omniscient / Braided)
- [ ] Verification questions list (what must be verified)
- [ ] Output: Story Intent Card that guides subsequent modes

---

#### Issue 7: Mode Navigation
**Type**: Feature  
**Priority**: High  
**Labels**: `frontend`, `navigation`  
**Description**:
Implement seamless mode switching.

**Acceptance Criteria**:
- [ ] Clear mode indicator: SEED → SHAPE → DRAFT → TEST
- [ ] Preserve state when switching modes
- [ ] Handle incomplete data gracefully (system degrades gracefully)

---

## Phase 2: Evidence Layer (Weeks 3-4)

### Epic: Evidence Bundles & Sources

#### Issue 8: Bundle CRUD
**Type**: Feature  
**Priority**: High  
**Labels**: `shape-mode`, `evidence`  
**Description**:
Implement evidence bundle management.

**Acceptance Criteria**:
- [ ] Create evidence bundles manually
- [ ] Assign bundle type (EVT, ID, QTY, ATTR, SEQ)
- [ ] Track reliability state (verified, sourced, unlinked, contested)
- [ ] Edit and delete bundles
- [ ] Add key extracts to bundles

---

#### Issue 9: Source Management
**Type**: Feature  
**Priority**: High  
**Labels**: `shape-mode`, `sources`  
**Description**:
Implement source import and management.

**Acceptance Criteria**:
- [ ] Add sources to bundles
- [ ] Source types: web, document, interview, personal, other
- [ ] Store source metadata (title, date, url, notes)
- [ ] Link sources to claims
- [ ] Paste URL and extract content
- [ ] Paste notes directly

---

#### Issue 10: Claims Management
**Type**: Feature  
**Priority**: High  
**Labels**: `shape-mode`, `evidence`  
**Description**:
Implement claim tracking within bundles.

**Acceptance Criteria**:
- [ ] Add claims to bundles
- [ ] Link claims to sources
- [ ] Display claims with source attribution
- [ ] Bundle summary showing reliability state

---

#### Issue 11: Scene Structure
**Type**: Feature  
**Priority**: High  
**Labels**: `shape-mode`, `structure`  
**Description**:
Implement scene creation and management.

**Acceptance Criteria**:
- [ ] Create scenes with titles
- [ ] Optional word count targets (advisory only)
- [ ] Scene mode (showing / telling / mixed)
- [ ] Sensory anchor field
- [ ] Reorder scenes with drag-and-drop
- [ ] Link bundles to scenes

---

#### Issue 12: SHAPE Mode Three-Panel Layout
**Type**: Feature  
**Priority**: High  
**Labels**: `shape-mode`, `ui`  
**Description**:
Build the SHAPE mode interface.

**Acceptance Criteria**:
- [ ] Left Panel: Evidence Bundles list
- [ ] Center Panel: Structure Board (scenes + beats)
- [ ] Right Panel: Bundle/Scene detail view
- [ ] Drag-and-drop between panels

---

## Phase 3: Structure Layer (Weeks 5-6)

### Epic: Beats & Scene Assignment

#### Issue 13: Beat Definitions
**Type**: Feature  
**Priority**: Medium  
**Labels**: `shape-mode`, `structure`  
**Description**:
Implement beat management for narrative structure.

**Acceptance Criteria**:
- [ ] Create custom beats (or use defaults from frameworks)
- [ ] Beat order management
- [ ] Beat descriptions
- [ ] Default beat templates (Freytag, Story Circle)

---

#### Issue 14: Scene-to-Beat Assignment
**Type**: Feature  
**Priority**: Medium  
**Labels**: `shape-mode`, `structure`  
**Description**:
Allow assigning scenes to beats (many-to-one relationship).

**Acceptance Criteria**:
- [ ] Assign multiple scenes to a single beat
- [ ] Leave scenes unassigned (optional)
- [ ] Beats panel overlay showing scene-beat mapping
- [ ] Identify structural gaps or imbalances

---

#### Issue 15: Structure Board Visualization
**Type**: Feature  
**Priority**: Medium  
**Labels**: `shape-mode`, `ui`  
**Description**:
Visualize story structure with beats and scenes.

**Acceptance Criteria**:
- [ ] Visual representation of beats
- [ ] Scenes grouped under their assigned beats
- [ ] Unassigned scenes section
- [ ] Scene word count and evidence indicators

---

## Phase 4: Draft Editor (Weeks 7-8)

### Epic: Writing Interface

#### Issue 16: Rich Text Editor
**Type**: Feature  
**Priority**: High  
**Labels**: `draft-mode`, `editor`  
**Description**:
Build the core manuscript editor.

**Acceptance Criteria**:
- [ ] Rich text editing with basic formatting (bold, italic, headers)
- [ ] Scene-based document structure
- [ ] Auto-save functionality
- [ ] Word count display per scene and total
- [ ] Clean writing surface by default

---

#### Issue 17: Scene List Panel
**Type**: Feature  
**Priority**: High  
**Labels**: `draft-mode`, `navigation`  
**Description**:
Implement the left panel showing scene list in DRAFT mode.

**Acceptance Criteria**:
- [ ] Scene list with word count progress
- [ ] Completion status indicators (✓ complete, ● in progress, ○ empty)
- [ ] Beat assignment display
- [ ] Quick navigation between scenes

---

#### Issue 18: Evidence Linking
**Type**: Feature  
**Priority**: High  
**Labels**: `draft-mode`, `evidence`  
**Description**:
Allow linking text to evidence claims.

**Acceptance Criteria**:
- [ ] Select text and link to existing claim
- [ ] Create new claim from selected text
- [ ] Evidence linking via selection → modal
- [ ] Mark as interpretation (excluded from reliability tracking)
- [ ] Keyboard shortcut: Cmd/Ctrl + L

---

#### Issue 19: Text Highlighting
**Type**: Feature  
**Priority**: Medium  
**Labels**: `draft-mode`, `ui`  
**Description**:
Implement color-coded highlighting for evidence grounding.

**Acceptance Criteria**:
- [ ] Green: Linked to verified/sourced evidence
- [ ] Yellow: Weak source
- [ ] Red/Orange: Looks like a claim but no evidence linked
- [ ] No highlight: Narrative/interpretation

---

#### Issue 20: Evidence & Warnings Panel
**Type**: Feature  
**Priority**: Medium  
**Labels**: `draft-mode`, `ui`  
**Description**:
Implement the right panel showing evidence for current scene.

**Acceptance Criteria**:
- [ ] Evidence used in current scene
- [ ] Warnings for unlinked claims
- [ ] Suggestions (link, hedge, reframe as interpretation)
- [ ] Non-blocking suggestions

---

## Phase 5: Review System (Weeks 9-10)

### Epic: TEST Mode & LLM Integration

#### Issue 21: LLM Integration Layer
**Type**: Infrastructure  
**Priority**: High  
**Labels**: `backend`, `ai`  
**Description**:
Set up LLM integration with appropriate model selection.

**Acceptance Criteria**:
- [ ] API integration for small model (4o-mini) - claim detection, tighten/hedge
- [ ] API integration for large model (GPT-4o, Claude) - full review
- [ ] Cost tracking per story
- [ ] Error handling and retry logic

---

#### Issue 22: TEST Mode UI Layout
**Type**: Feature  
**Priority**: High  
**Labels**: `test-mode`, `ui`  
**Description**:
Build the TEST mode interface.

**Acceptance Criteria**:
- [ ] Review report display area
- [ ] Priority fixes list with navigation
- [ ] Run review button
- [ ] Report history access

---

#### Issue 23: Review Generation
**Type**: Feature  
**Priority**: High  
**Labels**: `test-mode`, `ai`  
**Description**:
Generate comprehensive reliability and craft reviews.

**Acceptance Criteria**:
- [ ] Factual grounding assessment (status + specific issues)
- [ ] Reliability counts: verified, sourced, unlinked, contested
- [ ] Structure & flow observations (not grades)
- [ ] Voice & framing observations (not grades)
- [ ] Ethics/harm flags for consideration
- [ ] No numeric scores

---

#### Issue 24: Priority Fixes List
**Type**: Feature  
**Priority**: High  
**Labels**: `test-mode`, `ui`  
**Description**:
Actionable fix suggestions.

**Acceptance Criteria**:
- [ ] Top 3 actionable issues with locations
- [ ] Click to navigate to relevant paragraph
- [ ] Track which fixes have been addressed
- [ ] No automatic edits - author control

---

#### Issue 25: Report History
**Type**: Feature  
**Priority**: Medium  
**Labels**: `test-mode`, `storage`  
**Description**:
Save and compare previous review reports.

**Acceptance Criteria**:
- [ ] Save review reports with timestamps
- [ ] View previous reports
- [ ] Compare reports over time

---

## Phase 6: Craft Layer (Weeks 11-12)

### Epic: People, Themes & Arcs

#### Issue 26: People/Character Panel
**Type**: Feature  
**Priority**: Medium  
**Labels**: `craft`, `ui`  
**Description**:
Implement person/character tracking.

**Acceptance Criteria**:
- [ ] Person card minimal view (name, role, first appears)
- [ ] Person card expanded view (arc, details, speech patterns)
- [ ] Track appearances across scenes
- [ ] Source reliability vs character reliability distinction
- [ ] Link to evidence bundles

---

#### Issue 27: Theme Tracking
**Type**: Feature  
**Priority**: Medium  
**Labels**: `craft`, `ui`  
**Description**:
Implement theme management.

**Acceptance Criteria**:
- [ ] Create themes manually (system doesn't auto-detect)
- [ ] Theme descriptions
- [ ] Track theme appearances in scenes

---

#### Issue 28: Arc Definitions
**Type**: Feature  
**Priority**: Medium  
**Labels**: `craft`, `ui`  
**Description**:
Track character and narrator arcs.

**Acceptance Criteria**:
- [ ] Person arc (starting state, ending state, turning point)
- [ ] Narrator arc for first-person pieces
- [ ] Optional - not all pieces have clean arcs

---

#### Issue 29: Craft Observations in Review
**Type**: Feature  
**Priority**: Medium  
**Labels**: `test-mode`, `ai`  
**Description**:
Include craft observations in TEST mode review.

**Acceptance Criteria**:
- [ ] Scene function observations
- [ ] Pacing observations
- [ ] Setup/payoff analysis
- [ ] Telling vs showing identification
- [ ] Observations, not prescriptions

---

## Phase 7: Polish (Weeks 13-14)

### Epic: Assistance & UX

#### Issue 30: Assistance Actions
**Type**: Feature  
**Priority**: Medium  
**Labels**: `draft-mode`, `ai`  
**Description**:
Implement author-triggered writing assistance.

**Acceptance Criteria**:
- [ ] Link Evidence: Connect selected text to a claim
- [ ] Tighten: LLM rewrites paragraph more concisely
- [ ] Add Hedging: LLM adds uncertainty language to weak claims
- [ ] Mark as Interpretation: Remove from reliability tracking

---

#### Issue 31: Keyboard Shortcuts
**Type**: Feature  
**Priority**: Medium  
**Labels**: `ux`, `keyboard`  
**Description**:
Implement keyboard-first workflow.

**Acceptance Criteria**:
- [ ] Cmd/Ctrl + L: Link selected text to evidence
- [ ] Cmd/Ctrl + I: Mark selected text as interpretation
- [ ] Cmd/Ctrl + Enter: Run TEST review
- [ ] Cmd/Ctrl + 1-4: Switch modes

---

#### Issue 32: Progressive Disclosure UI
**Type**: Feature  
**Priority**: Medium  
**Labels**: `ux`, `ui`  
**Description**:
Implement information hierarchy.

**Acceptance Criteria**:
- [ ] Surface level: Scene list, word counts, overall status (always visible)
- [ ] Working level: Bundles, current paragraph's evidence, beat assignments
- [ ] Deep level: Individual claims, full provenance chain (on explicit request)

---

#### Issue 33: Data Persistence
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

#### Issue 34: Self-Testing with Real Story
**Type**: Task  
**Priority**: High  
**Labels**: `testing`, `documentation`  
**Description**:
Test the application with a real story.

**Acceptance Criteria**:
- [ ] Write a complete story using the tool
- [ ] Document friction points
- [ ] Log bugs found
- [ ] Create improvement suggestions

---

#### Issue 35: Open Questions Testing Tracker
**Type**: Documentation  
**Priority**: Low  
**Labels**: `testing`, `documentation`  
**Description**:
Track answers to open questions during testing.

**Questions to Track**:
1. Beat utility: Do authors use beat assignments, or just scenes?
2. Form distinction: Does marking a piece "personal" vs "reported" change behavior usefully?
3. Length guidance: Is advisory length helpful, or does it create pressure?
4. Non-linear support: Can the tool accommodate pieces that don't arc conventionally?
5. Interpretation marking: Do authors use "mark as interpretation" to reduce noise?

---

## Labels to Create in GitHub Project

| Label | Color | Description |
|-------|-------|-------------|
| `setup` | #E99695 | Initial setup tasks |
| `infrastructure` | #B60205 | Technical infrastructure |
| `backend` | #0E8A16 | Backend development |
| `frontend` | #1D76DB | Frontend development |
| `data-model` | #5319E7 | Data model design |
| `state` | #D93F0B | State management |
| `design` | #C2E0C6 | Design system |
| `seed-mode` | #0E8A16 | SEED mode features |
| `shape-mode` | #1D76DB | SHAPE mode features |
| `draft-mode` | #5319E7 | DRAFT mode features |
| `test-mode` | #D93F0B | TEST mode features |
| `craft` | #D4C5F9 | Craft layer features |
| `ai` | #FBCA04 | AI/LLM integration |
| `ui` | #C2E0C6 | User interface |
| `ux` | #BFD4F2 | User experience |
| `evidence` | #F9D0C4 | Evidence system |
| `sources` | #F9D0C4 | Source management |
| `structure` | #C2E0C6 | Story structure |
| `navigation` | #BFD4F2 | Navigation features |
| `editor` | #C5DEF5 | Editor functionality |
| `keyboard` | #BFD4F2 | Keyboard shortcuts |
| `storage` | #0E8A16 | Data storage |
| `testing` | #D93F0B | Testing |
| `documentation` | #0075CA | Documentation |

---

## Cost Tracking Reference

Based on strategy document estimates:

| Action | Estimated Cost |
|--------|----------------|
| Full Review | $0.50-1.00 |
| Tighten (per paragraph) | $0.01-0.02 |
| Hedge (per sentence) | $0.01 |
| **Typical story total** | **~$5-8** |

---

*Plan created: 2025-11-25*  
*Based on: StoryReview_Studio_Strategy_Version4.md*
