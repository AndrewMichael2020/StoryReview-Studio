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
#
# Based on: StoryReview_Studio_Strategy_Version4.md

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
gh label create "craft" --color "D4C5F9" --description "Craft layer features" --repo $REPO 2>/dev/null || echo "  Label 'craft' already exists"
gh label create "ai" --color "FBCA04" --description "AI/LLM integration" --repo $REPO 2>/dev/null || echo "  Label 'ai' already exists"
gh label create "ui" --color "C2E0C6" --description "User interface" --repo $REPO 2>/dev/null || echo "  Label 'ui' already exists"
gh label create "ux" --color "BFD4F2" --description "User experience" --repo $REPO 2>/dev/null || echo "  Label 'ux' already exists"
gh label create "evidence" --color "F9D0C4" --description "Evidence system" --repo $REPO 2>/dev/null || echo "  Label 'evidence' already exists"
gh label create "sources" --color "F9D0C4" --description "Source management" --repo $REPO 2>/dev/null || echo "  Label 'sources' already exists"
gh label create "structure" --color "C2E0C6" --description "Story structure" --repo $REPO 2>/dev/null || echo "  Label 'structure' already exists"
gh label create "navigation" --color "BFD4F2" --description "Navigation features" --repo $REPO 2>/dev/null || echo "  Label 'navigation' already exists"
gh label create "editor" --color "C5DEF5" --description "Editor functionality" --repo $REPO 2>/dev/null || echo "  Label 'editor' already exists"
gh label create "keyboard" --color "BFD4F2" --description "Keyboard shortcuts" --repo $REPO 2>/dev/null || echo "  Label 'keyboard' already exists"
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
# Phase 1: Foundation (Weeks 1-2)
# ============================================
echo "=== Phase 1: Foundation ==="

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
Phase 1: Foundation" \
"setup,infrastructure"

create_issue "Define Data Models" \
"## Description
Implement the core data models as defined in Part 6 of the strategy document.

## Acceptance Criteria
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

## Priority
High

## Type
Task

## Milestone
Phase 1: Foundation" \
"backend,data-model"

create_issue "Set Up State Management" \
"## Description
Implement state management for the application.

## Acceptance Criteria
- [ ] Choose state management solution (Zustand/Redux Toolkit recommended)
- [ ] Create stores for Story, Bundles, Scenes, Beats, Persons, and Themes
- [ ] Implement persistence layer (localStorage initially, IndexedDB later)
- [ ] Add undo/redo capability for editing actions

## Priority
High

## Type
Task

## Milestone
Phase 1: Foundation" \
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
Phase 1: Foundation" \
"frontend,design"

create_issue "Dashboard with Story Management" \
"## Description
Build the main dashboard for managing stories.

## Acceptance Criteria
- [ ] Story list view
- [ ] Create new story
- [ ] Open existing story
- [ ] Delete story
- [ ] Story status indicators

## Priority
High

## Type
Feature

## Milestone
Phase 1: Foundation" \
"frontend,ui"

create_issue "SEED Mode Intent Form" \
"## Description
Build the SEED mode interface for capturing story intent.

## Acceptance Criteria
- [ ] Title field (required)
- [ ] Premise field (1-3 sentences, required)
- [ ] Target length selector (optional - advisory only)
- [ ] Form selector (Reported / Personal essay / Hybrid / Other)
- [ ] POV selector (First / Third limited / Third omniscient / Braided)
- [ ] Verification questions list (what must be verified)
- [ ] Output: Story Intent Card that guides subsequent modes

## Priority
High

## Type
Feature

## Milestone
Phase 1: Foundation" \
"seed-mode,ui"

create_issue "Mode Navigation" \
"## Description
Implement seamless mode switching.

## Acceptance Criteria
- [ ] Clear mode indicator: SEED → SHAPE → DRAFT → TEST
- [ ] Preserve state when switching modes
- [ ] Handle incomplete data gracefully (system degrades gracefully)

## Priority
High

## Type
Feature

## Milestone
Phase 1: Foundation" \
"frontend,navigation"

# ============================================
# Phase 2: Evidence Layer (Weeks 3-4)
# ============================================
echo ""
echo "=== Phase 2: Evidence Layer ==="

create_issue "Bundle CRUD" \
"## Description
Implement evidence bundle management.

## Acceptance Criteria
- [ ] Create evidence bundles manually
- [ ] Assign bundle type (EVT, ID, QTY, ATTR, SEQ)
- [ ] Track reliability state (verified, sourced, unlinked, contested)
- [ ] Edit and delete bundles
- [ ] Add key extracts to bundles

## Priority
High

## Type
Feature

## Milestone
Phase 2: Evidence Layer" \
"shape-mode,evidence"

create_issue "Source Management" \
"## Description
Implement source import and management.

## Acceptance Criteria
- [ ] Add sources to bundles
- [ ] Source types: web, document, interview, personal, other
- [ ] Store source metadata (title, date, url, notes)
- [ ] Link sources to claims
- [ ] Paste URL and extract content
- [ ] Paste notes directly

## Priority
High

## Type
Feature

## Milestone
Phase 2: Evidence Layer" \
"shape-mode,sources"

create_issue "Claims Management" \
"## Description
Implement claim tracking within bundles.

## Acceptance Criteria
- [ ] Add claims to bundles
- [ ] Link claims to sources
- [ ] Display claims with source attribution
- [ ] Bundle summary showing reliability state

## Priority
High

## Type
Feature

## Milestone
Phase 2: Evidence Layer" \
"shape-mode,evidence"

create_issue "Scene Structure" \
"## Description
Implement scene creation and management.

## Acceptance Criteria
- [ ] Create scenes with titles
- [ ] Optional word count targets (advisory only)
- [ ] Scene mode (showing / telling / mixed)
- [ ] Sensory anchor field
- [ ] Reorder scenes with drag-and-drop
- [ ] Link bundles to scenes

## Priority
High

## Type
Feature

## Milestone
Phase 2: Evidence Layer" \
"shape-mode,structure"

create_issue "SHAPE Mode Three-Panel Layout" \
"## Description
Build the SHAPE mode interface.

## Acceptance Criteria
- [ ] Left Panel: Evidence Bundles list
- [ ] Center Panel: Structure Board (scenes + beats)
- [ ] Right Panel: Bundle/Scene detail view
- [ ] Drag-and-drop between panels

## Priority
High

## Type
Feature

## Milestone
Phase 2: Evidence Layer" \
"shape-mode,ui"

# ============================================
# Phase 3: Structure Layer (Weeks 5-6)
# ============================================
echo ""
echo "=== Phase 3: Structure Layer ==="

create_issue "Beat Definitions" \
"## Description
Implement beat management for narrative structure.

## Acceptance Criteria
- [ ] Create custom beats (or use defaults from frameworks)
- [ ] Beat order management
- [ ] Beat descriptions
- [ ] Default beat templates (Freytag, Story Circle)

## Priority
Medium

## Type
Feature

## Milestone
Phase 3: Structure Layer" \
"shape-mode,structure"

create_issue "Scene-to-Beat Assignment" \
"## Description
Allow assigning scenes to beats (many-to-one relationship).

## Acceptance Criteria
- [ ] Assign multiple scenes to a single beat
- [ ] Leave scenes unassigned (optional)
- [ ] Beats panel overlay showing scene-beat mapping
- [ ] Identify structural gaps or imbalances

## Priority
Medium

## Type
Feature

## Milestone
Phase 3: Structure Layer" \
"shape-mode,structure"

create_issue "Structure Board Visualization" \
"## Description
Visualize story structure with beats and scenes.

## Acceptance Criteria
- [ ] Visual representation of beats
- [ ] Scenes grouped under their assigned beats
- [ ] Unassigned scenes section
- [ ] Scene word count and evidence indicators

## Priority
Medium

## Type
Feature

## Milestone
Phase 3: Structure Layer" \
"shape-mode,ui"

# ============================================
# Phase 4: Draft Editor (Weeks 7-8)
# ============================================
echo ""
echo "=== Phase 4: Draft Editor ==="

create_issue "Rich Text Editor" \
"## Description
Build the core manuscript editor.

## Acceptance Criteria
- [ ] Rich text editing with basic formatting (bold, italic, headers)
- [ ] Scene-based document structure
- [ ] Auto-save functionality
- [ ] Word count display per scene and total
- [ ] Clean writing surface by default

## Priority
High

## Type
Feature

## Milestone
Phase 4: Draft Editor" \
"draft-mode,editor"

create_issue "Scene List Panel" \
"## Description
Implement the left panel showing scene list in DRAFT mode.

## Acceptance Criteria
- [ ] Scene list with word count progress
- [ ] Completion status indicators (✓ complete, ● in progress, ○ empty)
- [ ] Beat assignment display
- [ ] Quick navigation between scenes

## Priority
High

## Type
Feature

## Milestone
Phase 4: Draft Editor" \
"draft-mode,navigation"

create_issue "Evidence Linking" \
"## Description
Allow linking text to evidence claims.

## Acceptance Criteria
- [ ] Select text and link to existing claim
- [ ] Create new claim from selected text
- [ ] Evidence linking via selection → modal
- [ ] Mark as interpretation (excluded from reliability tracking)
- [ ] Keyboard shortcut: Cmd/Ctrl + L

## Priority
High

## Type
Feature

## Milestone
Phase 4: Draft Editor" \
"draft-mode,evidence"

create_issue "Text Highlighting" \
"## Description
Implement color-coded highlighting for evidence grounding.

## Acceptance Criteria
- [ ] Green: Linked to verified/sourced evidence
- [ ] Yellow: Weak source
- [ ] Red/Orange: Looks like a claim but no evidence linked
- [ ] No highlight: Narrative/interpretation

## Priority
Medium

## Type
Feature

## Milestone
Phase 4: Draft Editor" \
"draft-mode,ui"

create_issue "Evidence & Warnings Panel" \
"## Description
Implement the right panel showing evidence for current scene.

## Acceptance Criteria
- [ ] Evidence used in current scene
- [ ] Warnings for unlinked claims
- [ ] Suggestions (link, hedge, reframe as interpretation)
- [ ] Non-blocking suggestions

## Priority
Medium

## Type
Feature

## Milestone
Phase 4: Draft Editor" \
"draft-mode,ui"

# ============================================
# Phase 5: Review System (Weeks 9-10)
# ============================================
echo ""
echo "=== Phase 5: Review System ==="

create_issue "LLM Integration Layer" \
"## Description
Set up LLM integration with appropriate model selection.

## Acceptance Criteria
- [ ] API integration for small model (4o-mini) - claim detection, tighten/hedge
- [ ] API integration for large model (GPT-4o, Claude) - full review
- [ ] Cost tracking per story
- [ ] Error handling and retry logic

## Priority
High

## Type
Infrastructure

## Milestone
Phase 5: Review System" \
"backend,ai"

create_issue "TEST Mode UI Layout" \
"## Description
Build the TEST mode interface.

## Acceptance Criteria
- [ ] Review report display area
- [ ] Priority fixes list with navigation
- [ ] Run review button
- [ ] Report history access

## Priority
High

## Type
Feature

## Milestone
Phase 5: Review System" \
"test-mode,ui"

create_issue "Review Generation" \
"## Description
Generate comprehensive reliability and craft reviews.

## Acceptance Criteria
- [ ] Factual grounding assessment (status + specific issues)
- [ ] Reliability counts: verified, sourced, unlinked, contested
- [ ] Structure & flow observations (not grades)
- [ ] Voice & framing observations (not grades)
- [ ] Ethics/harm flags for consideration
- [ ] No numeric scores

## Priority
High

## Type
Feature

## Milestone
Phase 5: Review System" \
"test-mode,ai"

create_issue "Priority Fixes List" \
"## Description
Actionable fix suggestions.

## Acceptance Criteria
- [ ] Top 3 actionable issues with locations
- [ ] Click to navigate to relevant paragraph
- [ ] Track which fixes have been addressed
- [ ] No automatic edits - author control

## Priority
High

## Type
Feature

## Milestone
Phase 5: Review System" \
"test-mode,ui"

create_issue "Report History" \
"## Description
Save and compare previous review reports.

## Acceptance Criteria
- [ ] Save review reports with timestamps
- [ ] View previous reports
- [ ] Compare reports over time

## Priority
Medium

## Type
Feature

## Milestone
Phase 5: Review System" \
"test-mode,storage"

# ============================================
# Phase 6: Craft Layer (Weeks 11-12)
# ============================================
echo ""
echo "=== Phase 6: Craft Layer ==="

create_issue "People/Character Panel" \
"## Description
Implement person/character tracking.

## Acceptance Criteria
- [ ] Person card minimal view (name, role, first appears)
- [ ] Person card expanded view (arc, details, speech patterns)
- [ ] Track appearances across scenes
- [ ] Source reliability vs character reliability distinction
- [ ] Link to evidence bundles

## Priority
Medium

## Type
Feature

## Milestone
Phase 6: Craft Layer" \
"craft,ui"

create_issue "Theme Tracking" \
"## Description
Implement theme management.

## Acceptance Criteria
- [ ] Create themes manually (system doesn't auto-detect)
- [ ] Theme descriptions
- [ ] Track theme appearances in scenes

## Priority
Medium

## Type
Feature

## Milestone
Phase 6: Craft Layer" \
"craft,ui"

create_issue "Arc Definitions" \
"## Description
Track character and narrator arcs.

## Acceptance Criteria
- [ ] Person arc (starting state, ending state, turning point)
- [ ] Narrator arc for first-person pieces
- [ ] Optional - not all pieces have clean arcs

## Priority
Medium

## Type
Feature

## Milestone
Phase 6: Craft Layer" \
"craft,ui"

create_issue "Craft Observations in Review" \
"## Description
Include craft observations in TEST mode review.

## Acceptance Criteria
- [ ] Scene function observations
- [ ] Pacing observations
- [ ] Setup/payoff analysis
- [ ] Telling vs showing identification
- [ ] Observations, not prescriptions

## Priority
Medium

## Type
Feature

## Milestone
Phase 6: Craft Layer" \
"test-mode,ai"

# ============================================
# Phase 7: Polish (Weeks 13-14)
# ============================================
echo ""
echo "=== Phase 7: Polish ==="

create_issue "Assistance Actions" \
"## Description
Implement author-triggered writing assistance.

## Acceptance Criteria
- [ ] Link Evidence: Connect selected text to a claim
- [ ] Tighten: LLM rewrites paragraph more concisely
- [ ] Add Hedging: LLM adds uncertainty language to weak claims
- [ ] Mark as Interpretation: Remove from reliability tracking

## Priority
Medium

## Type
Feature

## Milestone
Phase 7: Polish" \
"draft-mode,ai"

create_issue "Keyboard Shortcuts" \
"## Description
Implement keyboard-first workflow.

## Acceptance Criteria
- [ ] Cmd/Ctrl + L: Link selected text to evidence
- [ ] Cmd/Ctrl + I: Mark selected text as interpretation
- [ ] Cmd/Ctrl + Enter: Run TEST review
- [ ] Cmd/Ctrl + 1-4: Switch modes

## Priority
Medium

## Type
Feature

## Milestone
Phase 7: Polish" \
"ux,keyboard"

create_issue "Progressive Disclosure UI" \
"## Description
Implement information hierarchy.

## Acceptance Criteria
- [ ] Surface level: Scene list, word counts, overall status (always visible)
- [ ] Working level: Bundles, current paragraph's evidence, beat assignments
- [ ] Deep level: Individual claims, full provenance chain (on explicit request)

## Priority
Medium

## Type
Feature

## Milestone
Phase 7: Polish" \
"ux,ui"

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
Phase 7: Polish" \
"backend,storage"

create_issue "Self-Testing with Real Story" \
"## Description
Test the application with a real story.

## Acceptance Criteria
- [ ] Write a complete story using the tool
- [ ] Document friction points
- [ ] Log bugs found
- [ ] Create improvement suggestions

## Priority
High

## Type
Task

## Milestone
Phase 7: Polish" \
"testing,documentation"

create_issue "Open Questions Testing Tracker" \
"## Description
Track answers to open questions during testing.

## Questions to Track
1. Beat utility: Do authors use beat assignments, or just scenes?
2. Form distinction: Does marking a piece 'personal' vs 'reported' change behavior usefully?
3. Length guidance: Is advisory length helpful, or does it create pressure?
4. Non-linear support: Can the tool accommodate pieces that don't arc conventionally?
5. Interpretation marking: Do authors use 'mark as interpretation' to reduce noise?

## Priority
Low

## Type
Documentation

## Milestone
Phase 7: Polish" \
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
echo "Total issues created: 35"
echo "============================================"
