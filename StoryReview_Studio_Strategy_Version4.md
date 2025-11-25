# StoryReview Studio – Strategic Design Document

> **Purpose**: A comprehensive strategy for building a fact-anchored literary non-fiction writing tool that balances journalistic rigor with narrative craft.

**Version**: 3.1  
**Date**: 2025-11-25

---

## Executive Summary

StoryReview Studio helps authors write literary non-fiction (typically 600–7,500 words) by separating **factual reliability** from **narrative expression** while providing tools for both. The core innovations are:

1. A **lightweight evidence layer** that tracks what must be true (events, identities, sequences)
2. A **literary craft layer** grounded in canonical story models that supports structure, character, and thematic coherence
3. A **review system** that provides actionable feedback without reductive scoring

The tool should be capable of supporting work ranging from tightly reported magazine features to lyrical, non-linear personal essays—accommodating both the evidentiary demands of journalism and the expressive freedoms of literary art.

---

## Part 1: Philosophy and Foundations

### 1.1 Why This App Exists

Literary non-fiction occupies a unique position: it must be **true** like journalism and **compelling** like fiction. Most writing tools optimize for one or the other. Word processors ignore both. AI writing assistants optimize for fluency at the expense of accuracy. Fact-checking tools ignore narrative craft.

StoryReview Studio exists because:

1. **Facts and narrative are different layers** that require different tools
2. **Authors need guardrails, not ghostwriters** – the tool should surface issues, not write for you
3. **Craft has structure** – narrative techniques can be learned and applied systematically, but never mechanically
4. **Rigor and creativity are not opposites** – knowing your facts are solid frees you to be bolder in expression
5. **Great literary non-fiction takes many forms** – from tightly structured reported pieces to dreamlike personal essays, the tool must accommodate all of them

### 1.2 The Two-Layer Model

| Layer | Description | Tool's Role |
|-------|-------------|-------------|
| **Reliability Layer** | Events, identities, sequences, quantities, quotes | Track, verify, flag issues |
| **Expression Layer** | Voice, structure, character, theme, craft | Support with frameworks, observe without grading |

**Key principle**: The system provides **status indicators and specific issues** for reliability, and **observations informed by craft frameworks** for expression. It never scores subjective qualities.[^1]

[^1]: Numeric scores (e.g., "7.4/10 for thematic depth") create false precision, encourage gaming, and are inconsistent across LLM runs. Status indicators ("3 unlinked claims") are honest about what the system actually knows.

### 1.3 On Length and Material

The length of a piece should be dictated by the quality and quantity of material the author has gathered, not by arbitrary targets.

| Guidance | Notes |
|----------|-------|
| **Minimum** | No minimum. If 600 words tells the story, that's the story. |
| **Typical range** | 2,000–5,000 words for most magazine-style pieces |
| **Soft maximum** | ~7,500 words (longer pieces may need different structural support) |

The tool allows authors to set target lengths as guides, but these are always advisory. The system should never pressure an author to pad thin material or cut rich material to hit a number.

### 1.4 Canonical Story Craft Models

The literary craft layer draws on established narrative frameworks. These are **lenses for understanding**—not templates to fill in. The greatest literary non-fiction often bends, subverts, or transcends these models while remaining in dialogue with them.

#### Freytag's Pyramid (Dramatic Structure)

The classical five-act structure provides vocabulary for narrative arc:

```
                    Climax
                      /\
                     /  \
           Rising   /    \  Falling
           Action  /      \ Action
                  /        \
    Exposition --/          \-- Dénouement
```

| Element | Function | In Literary Non-Fiction |
|---------|----------|------------------------|
| **Exposition** | Establish world, characters, stakes | Opening scene, context-setting |
| **Rising Action** | Complications build tension | Developing conflict, accumulating detail |
| **Climax** | Point of highest tension/change | The central event or revelation |
| **Falling Action** | Consequences unfold | Aftermath, reactions |
| **Dénouement** | Resolution, new equilibrium | Reflection, meaning-making |

#### The Story Circle (Dan Harmon / Joseph Campbell)

A simplified hero's journey useful for profile pieces and personal essays:

```
        1. Comfort Zone
              ↓
    8. Changed ← → 2. Want Something
        ↑               ↓
    7. Return      3. Unfamiliar Situation
        ↑               ↓
    6. Take    ←   4. Adapt
              ↖   ↙
           5. Get What They Wanted
              (but pay a price)
```

| Beat | Function | Example |
|------|----------|---------|
| 1. Zone | Establish normal life | "She had worked at the plant for 17 years" |
| 2. Want | Desire or need emerges | "She wanted to save the union" |
| 3. Unfamiliar | Cross into new territory | "The closure announcement changed everything" |
| 4. Adapt | Learn new rules | "She learned to organize, to speak publicly" |
| 5. Get | Achieve the goal (at cost) | "They won the vote, but the plant closed anyway" |
| 6. Take | Pay the price | "The victory felt hollow" |
| 7. Return | Go back to ordinary world | "She drives past the empty building every day" |
| 8. Changed | Transformed by journey | "Now she fights for other workers" |

#### Scene-Sequel Structure (Dwight Swain)

At the micro level, narrative alternates between action and reaction:

| Unit | Components | Function |
|------|------------|----------|
| **Scene** | Goal → Conflict → Disaster | Drive plot forward, create tension |
| **Sequel** | Reaction → Dilemma → Decision | Process events, set up next scene |

In literary non-fiction, this maps to:
- **Showing** (scene): Put the reader in the moment
- **Telling** (sequel): Provide context, reflection, meaning

#### Character Dimensions

Real people in non-fiction need the same dimensionality as fictional characters:

| Dimension | Description | Craft Question |
|-----------|-------------|----------------|
| **Want** | Conscious desire | What does this person say they want? |
| **Need** | Unconscious need | What do they actually need (that they may not see)? |
| **Lie** | False belief | What misconception shapes their actions? |
| **Ghost** | Formative wound | What past event explains their present? |
| **Arc** | Change over story | How are they different at the end? |

#### Thematic Integration

Theme emerges from the intersection of:

```
        Character Want/Need
              ↓
    Plot Events → Theme ← Setting/World
              ↑
         Author's Question
```

The author's job is not to state the theme but to **arrange elements so the theme emerges** for the reader.

### 1.5 Scenes and Beats: A Many-to-One Relationship

**Critical distinction**: Beats are narrative functions; scenes are units of prose. The relationship is hierarchical, not one-to-one.

```
BEAT: Rising Action
├── Scene 3: The first warning signs
├── Scene 4: Confrontation with management  
└── Scene 5: The leaked memo

BEAT: Climax
└── Scene 6: The factory's last day

BEAT: Falling Action
├── Scene 7: Aftermath in town
└── Scene 8: Maria's new path
```

**Implementation**: Authors can:
- Assign multiple scenes to a single beat
- Leave scenes unassigned (the tool infers nothing)
- Assign the same scene to multiple beats (if it serves multiple functions)
- Ignore beats entirely and work only with scenes

The beat structure is **a lens, not a cage**. Some of the greatest literary non-fiction spirals rather than arcs, accumulates rather than climaxes, suggests rather than resolves. The tool must accommodate this.

### 1.6 What Great Literary Non-Fiction Looks Like

The tool should be capable of supporting radically different approaches:

**Reported narrative** (magazine features, long-form journalism):
- Heavy evidence burden: names, dates, sources, verification
- Clear structural scaffolding (often explicit sections)
- Authorial voice present but restrained
- Multiple timelines braided together
- The facts do the work; the craft is in selection and arrangement

**Lyrical/personal essay**:
- Lighter evidence burden (often autobiographical memory)
- Non-linear, associative structure
- Authorial voice dominant
- Meaning emerges through accumulation and juxtaposition
- What "happened" may be less important than what it "means"

**Hybrid forms**:
- Braided essays weaving personal and reported strands
- Profiles that are also meditations on larger themes
- Event-driven pieces that spiral outward into history or philosophy

The tool should never assume one form is "correct." The reliability layer matters most for reported work; the craft layer matters for everything.

### 1.7 Design Principles

1. **Progressive disclosure**: Show complexity only when the author needs it
2. **Defaults that protect**: Unverified claims are flagged, not blocked
3. **Patterns over templates**: Learn from frameworks, don't impose formulas
4. **Observable but not overwhelming**: Every LLM action is logged, but logs are tucked away
5. **Voice is sacred**: Never silently alter the author's style
6. **Craft is optional but available**: Literary tools are there when needed, not required
7. **No scoring of expression**: Structure and voice get observations, not grades
8. **Length follows material**: The story is as long as it needs to be

---

## Part 2: Reliability System

### 2.1 Evidence Bundles

Instead of tracking atomic claims in a spreadsheet, the system groups related evidence into **bundles** that authors can manage at a conceptual level.

**Example Bundle: "Plant Closure 2019"**

| Component | Content |
|-----------|---------|
| **Name** | Plant Closure 2019 |
| **Type** | Event |
| **State** | Sourced |
| **Sources** | Local news 2019-03-14, Company report Q1, Interview with Maria |
| **Key Claims** | Closure in March 2019; ~300 workers affected; 90-day notice given |
| **Key Extracts** | "The River Mill plant closed in March 2019, laying off around 300 workers." |

### 2.2 Bundle Types

| Type | Badge | Description | Example |
|------|-------|-------------|---------|
| **Event** | EVT | Something that happened | "Factory closed March 2019" |
| **Identity** | ID | Person/place/org exists | "Maria Gonzalez, shift supervisor" |
| **Quantity** | QTY | A number or measurement | "300 workers laid off" |
| **Attribution** | ATTR | Someone said something | "Maria: 'We got notice in February'" |
| **Sequence** | SEQ | Order of events | "Notice came before closure" |

### 2.3 Reliability States

| State | Symbol | Meaning |
|-------|--------|---------|
| **Verified** | ✓ | 2+ independent sources |
| **Sourced** | ◐ | 1 documented source |
| **Unlinked** | ? | Claim exists but no source attached |
| **Contested** | ⚠ | Sources disagree |

**Fluidity principle**: States change as the author works. A claim starts as "Unlinked," becomes "Sourced" when evidence is attached, upgrades to "Verified" when a second source confirms it. The system tracks evolution without locking anything.

### 2.4 Source Types

| Type | Description | Trust Implication |
|------|-------------|-------------------|
| **Web** | Published article, public record | Generally reliable if from credible outlet |
| **Document** | Primary document (memo, report, letter) | High reliability for what it contains |
| **Interview** | Conversation with source | Reliable for what was said; source may have bias |
| **Personal** | Author's own observation/memory | Reliable for author's experience; not independently verifiable |
| **Other** | Anything else | Case-by-case assessment |

### 2.5 When Reliability Matters Less

For personal essays and memoir-adjacent work, the evidence burden is different:

| Claim Type | Reported Piece | Personal Essay |
|------------|----------------|----------------|
| Public facts (dates, names, events) | Must verify | Should verify if asserting |
| Others' statements | Must source | Best effort; memory acceptable with acknowledgment |
| Author's experience | Document if possible | Memory is the source |
| Author's interpretation | Distinguish from fact | Central to the form |

The tool should allow authors to mark sections or entire pieces as "personal/memoir" where the reliability expectations shift accordingly.

---

## Part 3: Literary Craft Layer

### 3.1 Principles for Craft Tools

1. **Craft is expression-layer, not reliability-layer**: These tools shape *how* you tell the story, not *whether* it's true
2. **Lightweight by default, detailed on demand**: Show minimal fields; let authors expand when needed
3. **Prompts over prescriptions**: Ask "Have you considered...?" rather than requiring checkboxes
4. **Integrated, not parallel**: Craft tools attach to existing structures (bundles, scenes) rather than creating separate tracking systems
5. **Accommodate non-linearity**: Not all stories arc; some spiral, accumulate, or drift

### 3.2 People/Characters Panel

Real people in non-fiction need to feel dimensional on the page.

**Person Card (minimal view)**:

| Field | Example |
|-------|---------|
| Name | Maria Gonzalez |
| Role | Protagonist |
| First appears | Scene 1 |

**Person Card (expanded view)**:

| Field | Example |
|-------|---------|
| Name | Maria Gonzalez |
| Role in story | Protagonist |
| Appears in | Scenes 1, 2, 4, 5 |
| Arc | Resigned → Fighting back |
| Characterizing details | Calloused hands, always early, says "you know" when emotional |
| Speech patterns | Formal English, occasional Spanish phrases, tends to understate |
| Source reliability | ◐ Sourced – direct participant, has motive |
| Linked evidence | → Maria's History bundle |

**Key distinction**: 
- **Source reliability** (in Evidence Bundle): Can I trust what Maria *told* me?
- **Character reliability** (in Person Card): How does the *reader* perceive Maria's trustworthiness *within the narrative*?

These can differ. Maria might be a reliable source but presented as an unreliable character (she has obvious motive). This is a craft choice.

### 3.3 Scene Attributes

| Attribute | Options | Purpose |
|-----------|---------|---------|
| **Title** | Freeform | Identify the scene |
| **Beat** | (Optional) Setup / Rising / Climax / Falling / Resolution / (custom) | Where in the arc? |
| **Mode** | Showing / Telling / Mixed | Are we in-scene or summarizing? |
| **Sensory anchor** | Freeform | One concrete detail that grounds the scene |
| **Word target** | Number or range | Advisory length |
| **Bundles** | Multi-select | Which evidence supports this scene? |

**Multiple scenes per beat**: A beat (like "Rising Action") can contain many scenes. The author assigns scenes to beats, not the reverse.

### 3.4 Thematic Tracking

| Theme | Description | Appears in |
|-------|-------------|------------|
| Labor vs. capital | Who has power over work? | Scenes 1, 3, 4 |
| Memory and loss | What do we hold onto? | Scenes 2, 5 |

**Author defines themes manually** – the system doesn't auto-detect themes (too reductive).

### 3.5 Arc Tracking

**Person Arc**:

| Field | Example |
|-------|---------|
| Person | Maria |
| Starting state | Resigned, defeated |
| Ending state | Fighting back, organizing |
| Turning point | Scene 4 – learns about WARN Act violation |

**Narrator Arc** (for first-person pieces):

| Field | Example |
|-------|---------|
| Starting understanding | Thought this was a simple job-loss story |
| Ending understanding | Realized it's about deliberate destruction of community |

**Note**: Not all pieces have clean arcs. For lyrical or accumulative structures, arc tracking may not apply. The tool should never require it.

---

## Part 4: Workflow and Modes

### 4.1 Four-Mode Structure

```
SEED → SHAPE → DRAFT → TEST
```

| Mode | Primary Activity | Reliability Focus | Craft Focus |
|------|------------------|-------------------|-------------|
| **SEED** | Define intent, plan research | Identify unknowns | Set POV, narrator stance |
| **SHAPE** | Build evidence, plan structure | Create bundles, add sources | Scene planning, character cards, beats |
| **DRAFT** | Write with grounding feedback | Link evidence, track states | Apply craft frameworks |
| **TEST** | Review and get feedback | Reliability report | Structural observations |

### 4.2 Mode Flow

Users can move between modes freely. The system degrades gracefully:

| If you skip... | What happens |
|----------------|--------------|
| SEED | SHAPE works, but no intent to guide suggestions |
| SHAPE | DRAFT works, but no evidence to link; TEST is sparse |
| DRAFT | TEST has nothing to review |

### 4.3 SEED Mode

**Purpose**: Capture story intent before gathering evidence.

**Fields**:

| Field | Required | Notes |
|-------|----------|-------|
| Title | Yes | Working title |
| Premise | Yes | 1-3 sentences: what is this story about? |
| Target Length | No | Advisory only; leave blank to let material dictate |
| Form | No | Reported / Personal essay / Hybrid / Other |
| POV | No | First / Third limited / Third omniscient / Braided |
| Verification Questions | No | What must you verify for this story to work? |

**Output**: Story Intent Card that guides subsequent modes.

### 4.4 SHAPE Mode

**Purpose**: Build evidence bundles and plan story structure.

**Three-Panel Layout**:

| Left Panel | Center Panel | Right Panel |
|------------|--------------|-------------|
| Evidence Bundles list | Structure Board (scenes + beats) | Bundle/Scene detail |

**Evidence Bundles Panel**:
- Create bundles manually
- Assign type (EVT, ID, QTY, ATTR, SEQ)
- Add sources and key extracts
- Track reliability state

**Structure Board**:
- Create scenes with titles
- Optional: assign scenes to beats
- Optional: set word count targets (or ranges)
- Link bundles to scenes
- Reorder freely

**Beats Panel** (optional overlay):
- Define beats (or use defaults from frameworks)
- See which scenes map to which beats
- Identify gaps or imbalances

### 4.5 DRAFT Mode

**Purpose**: Write with live evidence grounding feedback.

**Three-Panel Layout**:

| Left Panel | Center Panel | Right Panel |
|------------|--------------|-------------|
| Scene list with progress | Editor | Evidence + Warnings |

**Scene List**:
- Shows word count progress
- Indicates completion status (✓ complete, ● in progress, ○ empty)
- Shows beat assignment (if any)

**Editor**:
- Rich text editing
- Color-coded highlighting for evidence grounding:
  - Green: Linked to verified/sourced evidence
  - Yellow: Weak source
  - Red/Orange: Looks like a claim but no evidence linked
  - No highlight: Narrative/interpretation (not a factual claim)
- Evidence linking via selection → modal

**Evidence & Warnings Panel**:
- Evidence used in current scene
- Warnings for unlinked claims
- Suggestions (link, hedge, reframe as interpretation)

**Assistance Actions**:

| Action | What it does |
|--------|--------------|
| Link Evidence | Connect selected text to a claim |
| Tighten | LLM rewrites paragraph more concisely |
| Add Hedging | LLM adds uncertainty language to weak claims |
| Mark as Interpretation | Remove from reliability tracking |

### 4.6 TEST Mode

**Purpose**: Generate reliability review and craft observations.

**Review Report Sections**:

| Section | What It Assesses | Output Type |
|---------|------------------|-------------|
| **Factual Grounding** | Are claims linked? Sources reliable? Conflicts? | Status + specific issues |
| **Structure & Flow** | Scene balance, pacing, beat coverage | Observations (not grades) |
| **Voice & Framing** | POV consistency, narrator stance | Observations (not grades) |
| **Ethics / Harm** | Sensitive topics, source protection, fairness | Flags for consideration |

**Review Summary** (no numeric scores):

| Category | Display |
|----------|---------|
| Reliability | ✓ 5 verified, ◐ 4 sourced, ? 2 unlinked, ⚠ 1 contested |
| Structure | ◐ 2 observations |
| Voice | ✓ No issues |
| Ethics | ◐ 1 flag |

**Priority Fixes**: Top 3 actionable issues with locations.

**Report History**: Previous reports saved for comparison.

---

## Part 5: Cognitive Load Management

### 5.1 Progressive Disclosure

| Level | What's Visible | When |
|-------|----------------|------|
| **Surface** | Scene list, word counts, overall status | Always |
| **Working** | Bundles, current paragraph's evidence, beat assignments | In relevant mode |
| **Deep** | Individual claims, full provenance chain, all craft attributes | On explicit request |

### 5.2 Smart Defaults

- New bundles → default to "Unlinked" state
- New claims in draft → auto-detected and flagged (not blocked)
- New people mentioned → minimal card auto-created
- Beats → suggested based on scene position, never required

### 5.3 Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Cmd/Ctrl + L` | Link selected text to evidence |
| `Cmd/Ctrl + I` | Mark selected text as interpretation |
| `Cmd/Ctrl + Enter` | Run TEST review |
| `Cmd/Ctrl + 1-4` | Switch modes |

### 5.4 UI Loudness Levels

| Level | Condition | Behavior |
|-------|-----------|----------|
| **Quiet** | Everything verified or dismissed | Minimal indicators |
| **Attentive** | Unlinked claims exist | Subtle warnings |
| **Alert** | Contested claims or critical gaps | Visible flags |

---

## Part 6: Data Model

```typescript
// === STORY ===
interface Story {
  id: string;
  title: string;
  premise: string;
  targetLength?: number; // optional; material dictates length
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
  name: string; // e.g., "Rising Action", "Climax", or custom
  order: number;
  description?: string;
}

interface Scene {
  id: string;
  storyId: string;
  title: string;
  beatId?: string; // optional; many scenes can share one beat
  mode?: 'showing' | 'telling' | 'mixed';
  sensoryAnchor?: string;
  targetWordCount?: number; // can be null; material dictates
  bundleIds: string[];
  order: number;
}

// === CRAFT ===
interface Person {
  id: string;
  storyId: string;
  name: string;
  role: 'protagonist' | 'subject' | 'witness' | 'expert' | 'antagonist' | string;
  appearsIn: string[]; // scene IDs
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
  appearsIn: string[]; // scene IDs
}

// === MANUSCRIPT ===
interface Manuscript {
  storyId: string;
  scenes: ManuscriptScene[];
}

interface ManuscriptScene {
  sceneId: string;
  content: string;
  wordCount: number;
  links: EvidenceLink[];
}

interface EvidenceLink {
  id: string;
  claimId: string;
  bundleId: string;
  from: number;
  to: number;
  linkedText: string;
  isInterpretation?: boolean; // if true, excluded from reliability tracking
}

// === REVIEW ===
interface ReviewReport {
  id: string;
  storyId: string;
  createdAt: Date;
  reliability: {
    verified: number;
    sourced: number;
    unlinked: number;
    contested: number;
  };
  factualIssues: FactualIssue[];
  structureObservations: string[];
  voiceObservations: string[];
  ethicsFlags: EthicsFlag[];
  priorityFixes: PriorityFix[];
}
```

---

## Part 7: LLM Integration

### 7.1 Model Strategy

| Task | Model Class | Context |
|------|-------------|---------|
| Claim detection | Small (4o-mini) | Paragraph only |
| Tighten/Hedge | Small | Paragraph + context |
| Full Review | Large (GPT-4o, Claude) | Full story + bundles + intent |

### 7.2 Review Generation Prompt

```
You are a fact-checker and editor reviewing literary non-fiction.

STORY INTENT:
Title: {{title}}
Premise: {{premise}}
Form: {{form}}
POV: {{pov}}

EVIDENCE BUNDLES:
{{#each bundles}}
## {{name}} [{{type}} / {{state}}]
Sources: {{sources}}
Claims: {{claims}}
{{/each}}

STRUCTURE:
Beats: {{beats}}
Scenes: {{scenes with beat assignments}}

MANUSCRIPT:
{{manuscript}}

EVIDENCE LINKS:
{{links}}

Analyze and return JSON with:
1. "reliability": counts of verified/sourced/unlinked/contested
2. "factualIssues": specific problems with locations
3. "structureObservations": 2-3 observations (not grades)
4. "voiceObservations": POV consistency issues (not grades)
5. "ethicsFlags": concerns to consider
6. "priorityFixes": top 3 actions

IMPORTANT: 
- Do NOT assign numeric scores
- Respect the form: personal essays have different evidence expectations than reported pieces
- Observations about structure should note what IS, not prescribe what SHOULD BE
```

### 7.3 Cost Estimation

| Action | Estimated Cost |
|--------|----------------|
| Full Review | $0.50-1.00 |
| Tighten (per paragraph) | $0.01-0.02 |
| Hedge (per sentence) | $0.01 |
| **Typical story total** | **~$5-8** |

---

## Part 8: Development Roadmap

### Phase 1: Foundation (Weeks 1-2)

- Project setup
- Dashboard with story management
- SEED mode: intent form (with optional length)
- Basic navigation

### Phase 2: Evidence Layer (Weeks 3-4)

- Bundle CRUD
- Source management
- Scene structure
- Scene-bundle linking

### Phase 3: Structure Layer (Weeks 5-6)

- Beat definitions
- Scene-to-beat assignment (many-to-one)
- Structure board visualization

### Phase 4: Draft Editor (Weeks 7-8)

- Rich text editor
- Evidence linking
- Interpretation marking
- Text highlighting
- Warnings panel

### Phase 5: Review System (Weeks 9-10)

- LLM integration
- Review generation
- Report rendering
- Report history

### Phase 6: Craft Layer (Weeks 11-12)

- People/character panel
- Theme tracking
- Arc definitions
- Craft observations in review

### Phase 7: Polish (Weeks 13-14)

- Assistance actions
- Keyboard shortcuts
- Self-testing with real story
- Bug fixes

---

## Part 9: What This Tool Does NOT Include

| Feature | Reason |
|---------|--------|
| **Numeric scores** | False precision; encourages gaming |
| **Auto-generated prose** | Authors write; tool assists |
| **Rigid templates** | Frameworks inform, not constrain |
| **Style scoring** | Subjective; not actionable |
| **Fixed length requirements** | Material dictates length |
| **Grammar/spell check** | Use existing tools |
| **Publishing integration** | Out of scope |

---

## Part 10: Open Questions for Testing

1. **Beat utility**: Do authors use beat assignments, or just scenes?
2. **Form distinction**: Does marking a piece "personal" vs "reported" change behavior usefully?
3. **Length guidance**: Is advisory length helpful, or does it create pressure?
4. **Non-linear support**: Can the tool accommodate pieces that don't arc conventionally?
5. **Interpretation marking**: Do authors use "mark as interpretation" to reduce noise?

---

## Appendix A: Scenes and Beats Example

```yaml
story:
  title: "The Last Shift"
  
  beats:
    - name: "Exposition"
      scenes: [scene_1]
    - name: "Rising Action"  
      scenes: [scene_2, scene_3, scene_4]  # Multiple scenes in one beat
    - name: "Climax"
      scenes: [scene_5]
    - name: "Falling Action"
      scenes: [scene_6, scene_7]
    - name: "Resolution"
      scenes: [scene_8]
      
  scenes:
    - id: scene_1
      title: "The fluorescent hush"
      beat: "Exposition"
      mode: showing
      wordTarget: 600
      
    - id: scene_2
      title: "Maria's history"
      beat: "Rising Action"
      mode: telling
      wordTarget: 800
      
    - id: scene_3
      title: "The leaked memo"
      beat: "Rising Action"
      mode: showing
      wordTarget: 500
      
    # ... etc
```

---

## Appendix B: Example Evidence Bundle

```yaml
bundle:
  name: "Plant Closure 2019"
  type: event
  state: sourced
  
  sources:
    - type: web
      title: "River Mill to close in March"
      date: 2019-03-14
      url: "https://localnews.example/river-mill-closure"
      
    - type: document
      title: "Company Report Q1 2019"
      notes: "Confirms layoff numbers"
      
    - type: interview
      title: "Maria Gonzalez interview"
      date: 2024-01-15
      notes: "First-hand account of closure day"
  
  extracts:
    - "The River Mill plant closed in March 2019, laying off around 300 workers."
    - "Management announced the closure with the minimum required notice."
  
  claims:
    - text: "Plant closed in March 2019"
      sourceIds: [source_1, source_2]
    - text: "Approximately 300 workers laid off"
      sourceIds: [source_1, source_2]
    - text: "90-day WARN Act notice was filed"
      sourceIds: [source_2]
```

---

## Appendix C: Craft Framework Quick Reference

### Freytag's Pyramid

| Stage | Typical Beats | Notes |
|-------|---------------|-------|
| Exposition | Setup, Context | Multiple scenes possible |
| Rising Action | Complication, Development | Often the longest section |
| Climax | Turn, Crisis | May be a single scene |
| Falling Action | Aftermath, Consequences | Can be brief or extended |
| Dénouement | Resolution, Reflection | Meaning-making happens here |

### Story Circle Beats

| Beat | Typical Function |
|------|------------------|
| 1. Comfort | Opening – normal world |
| 2. Want | Setup – desire established |
| 3. Unfamiliar | Complication – things change |
| 4. Adapt | Development – learning/struggling |
| 5. Get | Turn – goal achieved (at cost) |
| 6. Take | Resolution – consequences |
| 7. Return | Aftermath – back to world |
| 8. Changed | Reflection – transformation |

### Scene-Sequel

| Unit | Mode Label | Characteristics |
|------|------------|-----------------|
| Scene | Showing | In the moment, sensory, dialogue |
| Sequel | Telling | Reflection, context, summary |

---

## Footnotes

[^1]: Numeric scores (e.g., "7.4/10 for thematic depth") create false precision, encourage gaming, and are inconsistent across LLM runs. Status indicators ("3 unlinked claims") are honest about what the system actually knows.

---

*StoryReview Studio Strategic Design Document*  
*Version 3.1 – 2025-11-25*