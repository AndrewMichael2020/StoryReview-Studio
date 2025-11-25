# StoryReview Studio - UI Sketch

This folder contains a minimal HTML/CSS/JS UI sketch for StoryReview Studio, based on the design vision outlined in [StoryReview_Studio_Strategy_v1_Version2 (2).md](../StoryReview_Studio_Strategy_v1_Version2%20(2).md).

## Overview

The UI sketch visualizes the 4-mode workflow (SEED → SHAPE → DRAFT → TEST) plus supporting views:

1. **Stories Dashboard** - Central hub for managing all stories
2. **SEED Mode** - Idea / Intent Workspace for capturing story ideas
3. **SHAPE Mode** - Evidence Bundles & Structure planning
4. **DRAFT Mode** - Editor with Structural & Fact Feedback
5. **TEST Mode** - Review / Scorecard for reliability testing
6. **Evidence Drawer** - Global overlay for evidence details
7. **Settings** - Voice & Style configuration

## How to View

Simply open `index.html` in a web browser:

```bash
# From the repository root
open ui-sketch/index.html
# or
xdg-open ui-sketch/index.html  # Linux
```

Or serve locally:

```bash
# Using Python
cd ui-sketch
python -m http.server 8080
# Then visit http://localhost:8080

# Using Node.js
npx serve ui-sketch
```

## Navigation

- Use the top navigation bar to switch between views
- Click on story rows in the Dashboard to simulate opening a story
- Click on mode tabs (SEED/SHAPE/DRAFT/TEST) within story views to switch modes
- Use the "Toggle Evidence Drawer Demo" button (bottom-right) to see the overlay

## Files

- `index.html` - Main HTML file containing all views
- `styles.css` - CSS styling with dark theme
- `script.js` - Basic JavaScript for view switching and interactivity
- `README.md` - This file

## Design Notes

### Color Scheme
- Dark theme for reduced eye strain during long writing sessions
- Accent color: Blue (#4a90d9) for interactive elements
- Status colors: Draft (yellow), Ready (green), Shape (cyan), Seed (purple)

### Reliability Indicators
- ✓ Verified (green)
- ◐ Sourced (yellow)
- ○ Claimed (gray)
- ? Unknown (gray)
- ⚠ Contested (orange)
- ∅ Unfounded (red)

### Bundle Tags
- EVT (Event) - Blue
- ID (Identity) - Purple
- SEQ (Sequence) - Orange
- ATTR (Attribution) - Teal
- QTY (Quantity) - Red

## Keyboard Shortcuts (Shown in UI)

### Dashboard
- `Enter` - Open story
- `D` - Duplicate
- `Del` - Archive
- `F` - Filter
- `/` - Search

### SEED Mode
- `Tab` - Switch panes
- `Ctrl+S` - Save Intent
- `N` - Move to SHAPE

### SHAPE Mode
- `B` - New bundle
- `T` - Change template
- `S` - Send to DRAFT

### DRAFT Mode
- `F2` - Toggle evidence overlay
- `Ctrl+E` - Open bundle
- `Alt+R` - Soft rewrite paragraph

### TEST Mode
- `J/K` - Move through issues
- `Enter` - Jump to paragraph in DRAFT
- `R` - Run again

## Implementation Notes

This is a **static mockup** for visualization purposes. It demonstrates:
- Layout and component organization
- Visual hierarchy and information architecture
- Color coding and status indicators
- Interaction patterns (clicking, navigation)

For a production implementation, consider:
- **Frontend**: React + Next.js (App Router)
- **State Management**: Zustand or Redux Toolkit
- **Data Persistence**: IndexedDB for local storage
- **LLM Integration**: OpenAI API for AI features
