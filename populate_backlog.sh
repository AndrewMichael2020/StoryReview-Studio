#!/bin/bash

# StoryReview Studio - GitHub Project Backlog Population Script
# 
# This script creates all issues for the StoryReview Studio POC and adds them
# to the GitHub Project at https://github.com/users/AndrewMichael2020/projects/8
#
# Prerequisites:
# 1. Install GitHub CLI: https://cli.github.com/
# 2. Authenticate: gh auth login
# 3. Make this script executable: chmod +x populate_backlog.sh
# 4. Run from the repository root: ./populate_backlog.sh
#
# Note: This script will create labels if they don't exist

set -e

REPO="AndrewMichael2020/StoryReview-Studio"
PROJECT_NUMBER=8

echo "🚀 Starting StoryReview Studio backlog population..."
echo ""

# Create labels first
echo "📌 Creating labels..."

gh label create "setup" --color "E99695" --description "Initial setup tasks" --repo $REPO 2>/dev/null || echo "  Label 'setup' already exists"
gh label create "infrastructure" --color "B60205" --description "Technical infrastructure" --repo $REPO 2>/dev/null || echo "  Label 'infrastructure' already exists"
gh label create "backend" --color "0E8A16" --description "Backend development" --repo $REPO 2>/dev/null || echo "  Label 'backend' already exists"
gh label create "frontend" --color "1D76DB" --description "Frontend development" --repo $REPO 2>/dev/null || echo "  Label 'frontend' already exists"
gh label create "data-model" --color "5319E7" --description "Data model design" --repo $REPO 2>/dev/null || echo "  Label 'data-model' already exists"
gh label create "state" --color "D93F0B" --description "State management" --repo $REPO 2>/dev/null || echo "  Label 'state' already exists"
gh label create "design" --color "C2E0C6" --description "Design system" --repo $REPO 2>/dev/null || echo "  Label 'design' already exists"
gh label create "seed-mode" --color "0E8A16" --description "SEED mode features" --repo $REPO 2>/dev/null || echo "  Label 'seed-mode' already exists"
gh label create "shape-mode" --color "1D76DB" --description "SHAPE mode features" --repo $REPO 2>/dev/null || echo "  Label 'shape-mode' already exists"
gh label create "draft-mode" --color "5319E7" --description "DRAFT mode features" --repo $REPO 2>/dev/null || echo "  Label 'draft-mode' already exists"
gh label create "test-mode" --color "D93F0B" --description "TEST mode features" --repo $REPO 2>/dev/null || echo "  Label 'test-mode' already exists"
gh label create "ai" --color "FBCA04" --description "AI/LLM integration" --repo $REPO 2>/dev/null || echo "  Label 'ai' already exists"
gh label create "ui" --color "C2E0C6" --description "User interface" --repo $REPO 2>/dev/null || echo "  Label 'ui' already exists"
gh label create "ux" --color "BFD4F2" --description "User experience" --repo $REPO 2>/dev/null || echo "  Label 'ux' already exists"
gh label create "evidence" --color "F9D0C4" --description "Evidence system" --repo $REPO 2>/dev/null || echo "  Label 'evidence' already exists"
gh label create "voice" --color "D4C5F9" --description "Voice preservation" --repo $REPO 2>/dev/null || echo "  Label 'voice' already exists"
gh label create "self-observation" --color "FEF2C0" --description "Session logging/analytics" --repo $REPO 2>/dev/null || echo "  Label 'self-observation' already exists"
gh label create "analytics" --color "FEF2C0" --description "Analytics and metrics" --repo $REPO 2>/dev/null || echo "  Label 'analytics' already exists"
gh label create "editor" --color "C5DEF5" --description "Editor functionality" --repo $REPO 2>/dev/null || echo "  Label 'editor' already exists"
gh label create "navigation" --color "BFD4F2" --description "Navigation features" --repo $REPO 2>/dev/null || echo "  Label 'navigation' already exists"
gh label create "sources" --color "F9D0C4" --description "Source management" --repo $REPO 2>/dev/null || echo "  Label 'sources' already exists"
gh label create "structure" --color "C2E0C6" --description "Story structure" --repo $REPO 2>/dev/null || echo "  Label 'structure' already exists"
gh label create "validation" --color "D93F0B" --description "Validation checks" --repo $REPO 2>/dev/null || echo "  Label 'validation' already exists"
gh label create "keyboard" --color "BFD4F2" --description "Keyboard shortcuts" --repo $REPO 2>/dev/null || echo "  Label 'keyboard' already exists"
gh label create "iteration" --color "C5DEF5" --description "Iterative improvements" --repo $REPO 2>/dev/null || echo "  Label 'iteration' already exists"
gh label create "storage" --color "0E8A16" --description "Data storage" --repo $REPO 2>/dev/null || echo "  Label 'storage' already exists"
gh label create "testing" --color "D93F0B" --description "Testing" --repo $REPO 2>/dev/null || echo "  Label 'testing' already exists"
gh label create "documentation" --color "0075CA" --description "Documentation" --repo $REPO 2>/dev/null || echo "  Label 'documentation' already exists"

echo ""
echo "✅ Labels created/verified"
echo ""

# Function to create an issue and add to project
create_issue() {
    local title="$1"
    local body="$2"
    local labels="$3"
    local milestone="$4"
    
    echo "📝 Creating issue: $title"
    
    # Create the issue
    issue_url=$(gh issue create \
        --repo $REPO \
        --title "$title" \
        --body "$body" \
        --label "$labels" 2>&1)
    
    if [[ $issue_url == *"github.com"* ]]; then
        echo "   ✓ Created: $issue_url"
        
        # Add to project
        gh project item-add $PROJECT_NUMBER --owner AndrewMichael2020 --url "$issue_url" 2>/dev/null || echo "   ⚠ Could not add to project (may need manual add)"
    else
        echo "   ✗ Failed to create issue: $issue_url"
    fi
}

echo "📋 Creating issues..."
echo ""

# ============================================
# M0: Project Setup
# ============================================
echo "=== M0: Project Setup ==="

create_issue "Initialize Project Repository" \
"## Description
Set up the project with proper structure and tooling.

## Acceptance Criteria
- [ ] Initialize frontend framework (React/Next.js recommended)
- [ ] Set up TypeScript configuration
- [ ] Configure ESLint and Prettier
- [ ] Set up testing framework (Jest + React Testing Library)
- [ ] Create basic folder structure
- [ ] Add README with project overview

## Priority
High

## Type
Task

## Milestone
M0: Project Setup" \
"setup,infrastructure"

create_issue "Define Data Models" \
"## Description
Implement the core data models as defined in Part 6.1 of the strategy document.

## Acceptance Criteria
- [ ] Story model (id, title, intent, voice_sample, admired_pieces)
- [ ] EvidenceBundle model (id, name, claims, sources)
- [ ] Claim model with types (event, identity, sequence, quantity, attribution, characterization)
- [ ] Claim states (verified, sourced, claimed, unknown, contested, unfounded)
- [ ] Scene model (id, title, description, target_word_count, bundles, order)
- [ ] Source model and SourceLink
- [ ] ReviewReport model
- [ ] SessionLog model for self-observation

## Priority
High

## Type
Task

## Milestone
M0: Project Setup" \
"backend,data-model"

create_issue "Set Up State Management" \
"## Description
Implement state management for the application.

## Acceptance Criteria
- [ ] Choose state management solution (Zustand/Redux Toolkit recommended)
- [ ] Create stores for Story, Bundles, Scenes, and Sessions
- [ ] Implement persistence layer (localStorage initially, IndexedDB later)
- [ ] Add undo/redo capability for editing actions

## Priority
High

## Type
Task

## Milestone
M0: Project Setup" \
"frontend,state"

create_issue "Design System & UI Components" \
"## Description
Create the foundational UI components and design tokens.

## Acceptance Criteria
- [ ] Set up component library (shadcn/ui or similar)
- [ ] Define color palette (including reliability state indicators)
- [ ] Create reliability state icons with accessible alternatives
- [ ] Implement 3 UI loudness levels (Quiet, Attentive, Alert)
- [ ] Create reusable Panel components for the layout

## Priority
Medium

## Type
Task

## Milestone
M0: Project Setup" \
"frontend,design"

# ============================================
# M1: Core Writing Loop
# ============================================
echo ""
echo "=== M1: Core Writing Loop ==="

create_issue "Manuscript Editor Foundation" \
"## Description
Build the core manuscript editor for writing.

## Acceptance Criteria
- [ ] Rich text editor with basic formatting (bold, italic, headers)
- [ ] Scene-based document structure
- [ ] Auto-save functionality
- [ ] Clean writing surface (no inline underlines by default)
- [ ] Word count display per scene and total

## Priority
High

## Type
Feature

## Milestone
M1: Core Writing Loop" \
"draft-mode,editor"

create_issue "Scene Structure Panel" \
"## Description
Implement the left panel showing scene structure.

## Acceptance Criteria
- [ ] Scene list with drag-and-drop reordering
- [ ] Reliability indicators per scene (● = verified, ○ = unverified)
- [ ] Word count progress per scene
- [ ] Quick navigation between scenes
- [ ] Add/delete/rename scene functionality

## Priority
High

## Type
Feature

## Milestone
M1: Core Writing Loop" \
"draft-mode,navigation"

create_issue "Basic Evidence Bundle UI" \
"## Description
Create manual evidence bundle management for DRAFT mode.

## Acceptance Criteria
- [ ] Create/edit/delete evidence bundles
- [ ] Add claims manually to bundles
- [ ] Set claim type and state
- [ ] Add author notes to claims
- [ ] Bundle summary showing worst reliability state

## Priority
High

## Type
Feature

## Milestone
M1: Core Writing Loop" \
"draft-mode,evidence"

create_issue "Claim Detection in Draft" \
"## Description
Implement background claim detection while writing.

## Acceptance Criteria
- [ ] Detect potential claims in text (events, quantities, attributions)
- [ ] Highlight unlinked claims on hover (not by default)
- [ ] Non-blocking, runs in background
- [ ] Flag potential claims for review without interrupting flow

## Priority
Medium

## Type
Feature

## Milestone
M1: Core Writing Loop" \
"draft-mode,ai"

create_issue "Evidence Linking UI" \
"## Description
Allow linking text to evidence bundles.

## Acceptance Criteria
- [ ] Select text and link to existing claim
- [ ] Create new claim from selected text
- [ ] Show evidence trail on paragraph hover
- [ ] One-click evidence linking
- [ ] Keyboard shortcut: Cmd/Ctrl + Shift + L

## Priority
Medium

## Type
Feature

## Milestone
M1: Core Writing Loop" \
"draft-mode,evidence"

create_issue "Evidence Trail Panel" \
"## Description
Implement the right panel showing evidence for current paragraph.

## Acceptance Criteria
- [ ] Shows reliability state of claims in current paragraph
- [ ] One-click to link evidence
- [ ] Option to add hedging language
- [ ] Non-blocking suggestions

## Priority
Medium

## Type
Feature

## Milestone
M1: Core Writing Loop" \
"draft-mode,ui"

create_issue "Session Logging for Self-Observation" \
"## Description
Implement automatic session logging as per Part 5 of the strategy document.

## Acceptance Criteria
- [ ] Log session duration and mode time distribution
- [ ] Track actions (added source, linked evidence, etc.)
- [ ] Detect friction markers (repeated actions, long pauses, mode bouncing)
- [ ] Store session logs in SessionLog model

## Priority
Medium

## Type
Feature

## Milestone
M1: Core Writing Loop" \
"analytics,self-observation"

create_issue "Mode Navigation" \
"## Description
Implement seamless mode switching.

## Acceptance Criteria
- [ ] Clear mode indicator: SEED → SHAPE → DRAFT → TEST
- [ ] Preserve state when switching modes
- [ ] Track mode time for self-observation
- [ ] Handle incomplete data gracefully

## Priority
High

## Type
Feature

## Milestone
M1: Core Writing Loop" \
"frontend,navigation"

create_issue "LLM Integration Layer" \
"## Description
Set up LLM integration with appropriate model selection.

## Acceptance Criteria
- [ ] API integration for small model (4o-mini) - Q&A, claim extraction
- [ ] API integration for medium model - pattern matching, paragraph assistance
- [ ] API integration for large model (Opus/Gemini Pro) - reviews, red team
- [ ] Cost tracking per story
- [ ] Error handling and retry logic

## Priority
High

## Type
Infrastructure

## Milestone
M1: Core Writing Loop" \
"backend,ai"

# ============================================
# M2: Evidence Layer
# ============================================
echo ""
echo "=== M2: Evidence Layer ==="

create_issue "SEED Mode UI Layout" \
"## Description
Build the SEED mode interface.

## Acceptance Criteria
- [ ] Left panel: Free text area for story idea (2-3 paragraphs)
- [ ] Right top: Story Intent Card (working title, target length, tone)
- [ ] Right middle: Unknowns to Resolve checklist
- [ ] Right bottom: Research Sources checklist
- [ ] Bottom left: Assistant Q&A conversation

## Priority
High

## Type
Feature

## Milestone
M2: Evidence Layer" \
"seed-mode,ui"

create_issue "Guided Q&A System" \
"## Description
Implement the AI-guided Q&A to surface story requirements.

## Acceptance Criteria
- [ ] Targeted questions to identify what author knows vs assumes
- [ ] Surface what must be verified for the piece to work
- [ ] Identify potential sensitivity areas
- [ ] Use small model (4o-mini) for efficiency
- [ ] Conversational interface

## Priority
High

## Type
Feature

## Milestone
M2: Evidence Layer" \
"seed-mode,ai"

create_issue "Unknowns List Generation" \
"## Description
Auto-generate and manage the unknowns checklist.

## Acceptance Criteria
- [ ] Auto-generate from Q&A conversation
- [ ] Editable by author
- [ ] Check-off functionality
- [ ] Becomes research checklist

## Priority
Medium

## Type
Feature

## Milestone
M2: Evidence Layer" \
"seed-mode,ai"

create_issue "Story Intent Card" \
"## Description
Implement the story metadata capture.

## Acceptance Criteria
- [ ] Working title field
- [ ] Target length selector
- [ ] Tone/style selector
- [ ] Sensitivity flags (checkboxes)
- [ ] Persist with story

## Priority
Medium

## Type
Feature

## Milestone
M2: Evidence Layer" \
"seed-mode,ui"

create_issue "SHAPE Mode UI Layout" \
"## Description
Build the SHAPE mode interface with two main areas.

## Acceptance Criteria
- [ ] Evidence Bundles Panel
- [ ] Structure Canvas for scene cards
- [ ] Drag-and-drop between panels
- [ ] Collapsible voice & style samples section

## Priority
High

## Type
Feature

## Milestone
M2: Evidence Layer" \
"shape-mode,ui"

create_issue "Source Ingestion" \
"## Description
Implement source import functionality.

## Acceptance Criteria
- [ ] Paste URL and extract content
- [ ] Upload PDF and extract text
- [ ] Paste notes directly
- [ ] Store source metadata (type, title, date, publication)

## Priority
High

## Type
Feature

## Milestone
M2: Evidence Layer" \
"shape-mode,sources"

create_issue "Automatic Claim Extraction" \
"## Description
Use AI to extract claims from sources.

## Acceptance Criteria
- [ ] Extract claims from source text
- [ ] Categorize claim types automatically
- [ ] Group claims into suggested bundles
- [ ] Use small model for efficiency
- [ ] Allow author editing of extracted claims

## Priority
High

## Type
Feature

## Milestone
M2: Evidence Layer" \
"shape-mode,ai"

create_issue "Evidence Bundle Management" \
"## Description
Full bundle management capabilities.

## Acceptance Criteria
- [ ] Create, rename, merge, split bundles
- [ ] Reliability states shown at bundle level
- [ ] Worst state bubbles up to bundle indicator
- [ ] Filter and search bundles

## Priority
Medium

## Type
Feature

## Milestone
M2: Evidence Layer" \
"shape-mode,evidence"

create_issue "Structure Canvas" \
"## Description
Implement freeform scene card organization.

## Acceptance Criteria
- [ ] Create scene cards with custom names
- [ ] Drag bundles onto scenes
- [ ] Reorder scenes with drag-and-drop
- [ ] Optional word count targets per scene
- [ ] Scene description field (author's own words)

## Priority
Medium

## Type
Feature

## Milestone
M2: Evidence Layer" \
"shape-mode,structure"

create_issue "Pattern References" \
"## Description
Suggest similar published pieces for reference.

## Acceptance Criteria
- [ ] Suggest pieces with similar structures
- [ ] Show how reference pieces were organized
- [ ] These are references, not constraints
- [ ] Author can dismiss/save references

## Priority
Low

## Type
Feature

## Milestone
M2: Evidence Layer" \
"shape-mode,ai"

create_issue "Health Checks" \
"## Description
Flag potential structural issues.

## Acceptance Criteria
- [ ] Flag unused bundles
- [ ] Flag scenes with no evidence
- [ ] Flag unresolved unknowns
- [ ] Suggestions, not requirements
- [ ] Dismissable warnings

## Priority
Medium

## Type
Feature

## Milestone
M2: Evidence Layer" \
"shape-mode,validation"

create_issue "Voice & Style Samples" \
"## Description
Collect voice samples for preservation.

## Acceptance Criteria
- [ ] Input for author's own voice sample (300-500 words)
- [ ] Add admired pieces with notes
- [ ] Notes on what to admire (structure, pacing, voice, argument)
- [ ] Store with story for later use

## Priority
Medium

## Type
Feature

## Milestone
M2: Evidence Layer" \
"shape-mode,voice"

# ============================================
# M3: Review System
# ============================================
echo ""
echo "=== M3: Review System ==="

create_issue "TEST Mode UI Layout" \
"## Description
Build the TEST mode interface.

## Acceptance Criteria
- [ ] Test type selector (Full Review, Red Team, Fact Check)
- [ ] Report display area
- [ ] Priority fixes list with navigation
- [ ] Run test button

## Priority
High

## Type
Feature

## Milestone
M3: Review System" \
"test-mode,ui"

create_issue "Reliability Report Generation" \
"## Description
Generate comprehensive reliability reports.

## Acceptance Criteria
- [ ] Type-by-type breakdown of claim states
- [ ] Counts per category, not scores
- [ ] Flag specific issues with context
- [ ] Navigate to flagged paragraphs
- [ ] Use large model for comprehensive analysis

## Priority
High

## Type
Feature

## Milestone
M3: Review System" \
"test-mode,ai"

create_issue "Red Team Analysis" \
"## Description
Adversarial analysis of the piece.

## Acceptance Criteria
- [ ] 'If a hostile fact-checker reviewed this piece' analysis
- [ ] 'If the story's subject responded' analysis
- [ ] Surface uncorroborated claims
- [ ] Identify potential disputes
- [ ] Use large model for adversarial thinking

## Priority
Medium

## Type
Feature

## Milestone
M3: Review System" \
"test-mode,ai"

create_issue "Structural Observations" \
"## Description
Non-scored observations about structure.

## Acceptance Criteria
- [ ] Pacing observations
- [ ] Setup/payoff analysis
- [ ] Scene function review
- [ ] Identify telling vs showing
- [ ] Flag new information in endings

## Priority
Medium

## Type
Feature

## Milestone
M3: Review System" \
"test-mode,ai"

create_issue "Priority Fixes List" \
"## Description
Actionable fix suggestions.

## Acceptance Criteria
- [ ] 'If you do only three things' list
- [ ] Click to navigate to relevant paragraph
- [ ] Track which fixes have been addressed
- [ ] No automatic edits - author control

## Priority
High

## Type
Feature

## Milestone
M3: Review System" \
"test-mode,ui"

create_issue "Data Persistence" \
"## Description
Implement reliable data storage.

## Acceptance Criteria
- [ ] Local storage for POC (IndexedDB)
- [ ] Auto-save every 30 seconds
- [ ] Export story as JSON
- [ ] Import story from JSON
- [ ] Backup/restore functionality

## Priority
High

## Type
Infrastructure

## Milestone
M3: Review System" \
"backend,storage"

# ============================================
# M4: Polish & Voice
# ============================================
echo ""
echo "=== M4: Polish & Voice ==="

create_issue "Voice Sample Comparison" \
"## Description
Compare rewrites against author's voice.

## Acceptance Criteria
- [ ] Compare AI output to voice sample
- [ ] Detect significant voice drift
- [ ] Warn: 'This rewrite is more formal/informal than your usual style'
- [ ] Options: Accept, Reject, 'Rewrite again, closer to my voice'

## Priority
High

## Type
Feature

## Milestone
M4: Polish & Voice" \
"voice,ai"

create_issue "Assistance Actions in DRAFT" \
"## Description
Implement author-triggered assistance.

## Acceptance Criteria
- [ ] Light Touch: Tighten paragraph, Clarify sentence, Add hedging
- [ ] Structural: Suggest opening, Propose transition
- [ ] Rebuild: Rewrite scene, Compress section (shows full diff)
- [ ] Safeguards: Check against voice sample, Never add claims not in bundles

## Priority
Medium

## Type
Feature

## Milestone
M4: Polish & Voice" \
"draft-mode,ai"

create_issue "Keyboard Shortcuts" \
"## Description
Implement keyboard-first workflow.

## Acceptance Criteria
- [ ] Cmd/Ctrl + Shift + E: Open evidence trail for current paragraph
- [ ] Cmd/Ctrl + Shift + L: Link selected text to evidence
- [ ] Cmd/Ctrl + Shift + H: Add hedging to selected claim
- [ ] Cmd/Ctrl + Shift + K: Run quick reliability check on current scene
- [ ] Cmd/Ctrl + Shift + A: Open assistance menu

## Priority
Medium

## Type
Feature

## Milestone
M4: Polish & Voice" \
"ux,keyboard"

create_issue "Progressive Disclosure UI" \
"## Description
Implement information hierarchy.

## Acceptance Criteria
- [ ] Surface level: Scene list, word counts, overall reliability (always visible)
- [ ] Working level: Evidence bundles, current paragraph claims (mode-specific)
- [ ] Deep level: Individual claims, source documents (on explicit request)

## Priority
Medium

## Type
Feature

## Milestone
M4: Polish & Voice" \
"ux,ui"

create_issue "Post-Session Reflection" \
"## Description
Prompt for reflection after sessions.

## Acceptance Criteria
- [ ] Prompt after each session
- [ ] Questions: What felt smooth? Where was friction? What did you want to do?
- [ ] Store with session log

## Priority
Low

## Type
Feature

## Milestone
M4: Polish & Voice" \
"self-observation,ui"

create_issue "Weekly Review Dashboard" \
"## Description
Aggregate self-observation data.

## Acceptance Criteria
- [ ] Sessions count and total time
- [ ] Mode distribution chart
- [ ] Top friction points
- [ ] Features never used
- [ ] Author notes from reflections

## Priority
Low

## Type
Feature

## Milestone
M4: Polish & Voice" \
"self-observation,analytics"

create_issue "Friction Point Fixes" \
"## Description
Address issues identified through self-observation.

## Acceptance Criteria
- [ ] Review friction markers from session logs
- [ ] Prioritize based on frequency
- [ ] Implement fixes
- [ ] Verify improvement

## Priority
Medium

## Type
Task

## Milestone
M4: Polish & Voice" \
"ux,iteration"

create_issue "Open Questions Testing Tracker" \
"## Description
Track answers to open questions during testing.

## Questions to Track
1. Bundle granularity: How many bundles feel manageable? (Hypothesis: 5-8)
2. Claim detection accuracy: Miss rate and false positive rate
3. Voice drift: Can author feel when rewrite doesn't match? Is warning helpful?
4. Mode sequence: Do users follow SEED → SHAPE → DRAFT → TEST or jump?
5. Red team usefulness: Does it surface unconsidered issues?
6. Reliability states: Are 6 states too many? Would 4 suffice?
7. Session length: How long before fatigue? Does UI contribute?

## Priority
Low

## Type
Documentation

## Milestone
M4: Polish & Voice" \
"testing,documentation"

echo ""
echo "============================================"
echo "✅ Backlog population complete!"
echo ""
echo "Next steps:"
echo "1. Go to https://github.com/users/AndrewMichael2020/projects/8"
echo "2. Configure project views (Board, Table, etc.)"
echo "3. Set up milestone columns if not auto-created"
echo "4. Prioritize issues in the backlog"
echo ""
echo "Total issues created: 39"
echo "============================================"
