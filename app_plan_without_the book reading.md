# EMBER — Revised Flutter App Plan
### *The Discipline Diagnostic* (No Book Library)

---

## 1. IDENTITY & VISION

**Working Name:** Ember
**Tagline:** *"Find your block. Fix your discipline."*
**Positioning:** A precision diagnostic tool for behavior change. Not a habit tracker. Not a book reader. A focused, interactive 7-14 day prescription system based on your specific discipline blocks.

---

## 2. DESIGN SYSTEM

*(Colors, Typography, Spacing, Shadows remain exactly the same as the previous plan — Golden Hour palette, Playfair Display / Cormorant Garamond / Nunito fonts, dark luxury aesthetic.)*

---

## 3. ANIMATION SYSTEM

*(All animations remain exactly the same: Golden Particles, Streak Flame, Glassmorphic Cards, Shimmer Sweep for locked items, Confetti on completion, Gold Fade transitions.)*

---

## 4. REVISED SCREEN BLUEPRINTS (8 Core Screens)

### SCREEN 1: Splash (Same as before)
### SCREEN 2: Onboarding - 3 Pages (Same as before)
### SCREEN 3: Diagnostic Quiz (Same as before)
### SCREEN 4: Analyzing (Same as before)
### SCREEN 5: Diagnostic Result (Same as before)

---

### SCREEN 6: Home (Revised)

```
┌─────────────────────────────────┐
│  Good morning        🔔  👤    │
│  [user name]                    │
│                                 │
│  ┌─────────────────────────┐   │
│  │ 🔥 12 days              │   │  ← Streak card
│  │ Your longest: 23 days   │   │
│  │ ═════════════░░░░░░░░░  │   │
│  └─────────────────────────┘   │
│                                 │
│  TODAY'S PROTOCOL               │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Day 3 of 7             │   │  ← TODAY'S CARD (Gold border)
│  │  "The 70% Standard"     │   │
│  │                         │   │
│  │  "The last 30% takes    │   │
│  │   80% of the time..."   │   │
│  │                         │   │
│  │  ╭═══════════════════╮  │   │
│  │  ║  Begin Session  →  ║  │   │
│  │  ╰═══════════════════╯  │   │
│  └─────────────────────────┘   │
│                                 │
│  YOUR PROGRAMS                  │
│  ┌──────┐ ┌──────┐ ┌──────┐   │  ← Horizontal scroll
│  │ 🔒   │ │ 🔄  │ │ ✅   │   │
│  │ Fear │ │Focus │ │Perf  │   │
│  │ 7d   │ │ 7d   │ │ 7d   │   │
│  └──────┘ └──────┘ └──────┘   │
│                                 │
│  ┌─────────────────────────┐   │  ← Trial banner (if applicable)
│  │ ⏰ 4 days left in trial │   │
│  │ View Plans →            │   │
│  └─────────────────────────┘   │
│                                 │
│  ═══════════════════════════    │
│  🏠    📚    📊               │  ← 3 tabs only now
│  Home  Progs Insights          │
└─────────────────────────────────┘
```

---

### SCREEN 7: Daily Protocol (Same as before)

```
┌─────────────────────────────────┐
│  ← Back          Day 3 of 7    │
│                                 │
│  ╭─── progress dots ───╮       │
│  │ ● ● ● ○ ○ ○ ○      │       │
│  ╰─────────────────────╯       │
│                                 │
│     "The 70% Standard"         │
│                                 │
│  ┌─────────────────────────┐   │
│  │  "The last 30% of      │   │  ← Insight card
│  │   perfection takes     │   │
│  │   80% of your time..." │   │
│  └─────────────────────────┘   │
│                                 │
│  TODAY'S ACTION                 │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Pick one task you've   │   │  ← Action card
│  │  been overthinking...   │   │
│  └─────────────────────────┘   │
│                                 │
│  HOW DID IT FEEL?               │
│  ┌────┐ ┌────┐ ┌────┐ ┌────┐  │
│  │ 😤 │ │ 😐 │ │ 🤔 │ │ 😊 │  │
│  │Hard │ │Meh │ │Weird│ │Free │  │
│  └────┘ └────┘ └────┘ └────┘  │
│                                 │
│  ╭═══════════════════════════╮  │
│  ║     ✓ I Did It Today     ║  │
│  ╰═══════════════════════════╯  │
└─────────────────────────────────┘
```

---

### SCREEN 8: Protocol Complete (Same as before)
*(Confetti, streak update, reflection question, share button)*

---

### SCREEN 9: Programs Library (Revised)

```
┌─────────────────────────────────┐
│  Programs                       │
│                                 │
│  ╭─ YOUR PRESCRIPTION ────────╮  │
│  │                            │  │
│  │ ┌──────────────────────┐  │  │  ← Unlocked based on
│  │ │ ✅ Perfectionism 7-Day│  │  │     diagnostic result
│  │ └──────────────────────┘  │  │
│  │ ┌──────────────────────┐  │  │
│  │ │ 🔄 Overwhelm 7-Day   │  │  │  ← Active = gold border
│  │ │    Day 2/7            │  │
│  │ │    ═══░░░░░░░░░░░░   │  │
│  │ └──────────────────────┘  │  │
│  │ ┌──────────────────────┐  │  │
│  │ │ 🔒 Future Self 7-Day │  │  │  ← Locked = shimmer
│  │ └──────────────────────┘  │  │
│  ╰────────────────────────────╯  │
│                                 │
│  ╭─ ALL PROGRAMS ────────────╮  │
│  │ ┌──────────┐┌──────────┐  │  │
│  │ │ 🔒       ││ 🔒       │  │  │
│  │ │Willpower ││Fear of   │  │  │
│  │ │7-Day     ││Success   │  │  │  ← 2-column grid
│  │ └──────────┘└──────────┘  │  │
│  │ ┌──────────┐┌──────────┐  │  │
│  │ │ 🔒       ││ 🔒       │  │  │
│  │ │Comfort   ││Attention  │  │  │
│  │ │Zone 7-Day││7-Day     │  │  │
│  │ └──────────┘└──────────┘  │  │
│  ╰────────────────────────────╯  │
│                                 │
│  ═══════════════════════════    │
│  🏠    📚    📊               │
└─────────────────────────────────┘
```

---

### SCREEN 10: Program Detail (Revised - No book refs)

```
┌─────────────────────────────────┐
│  ← Back                        │
│                                 │
│  ┌─────────────────────────┐   │
│  │  (golden gradient bg)   │   │
│  │                         │   │
│  │  Overwhelm 7-Day Reset  │   │
│  │                         │   │
│  │  When everything feels  │   │
│  │  like too much, start   │   │
│  │  with one thing.        │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Your Block Match: 92%  │   │
│  │  ══════════════════░░░  │   │
│  └─────────────────────────┘   │
│                                 │
│  WHAT YOU'LL BUILD              │
│  • Ability to find the          │
│    first step                   │
│  • Tolerance for imperfect      │
│    progress                     │
│  • Momentum from small wins     │
│                                 │
│  DAY BY DAY                    │
│  ┌─────────────────────────┐   │
│  │ ✅ Day 1: The Mountain  │   │
│  │ ✅ Day 2: Just Start    │   │
│  │ 🔄 Day 3: [Today]      │   │
│  │ 🔒 Day 4                │   │
│  │ 🔒 Day 5                │   │
│  │ 🔒 Day 6                │   │
│  │ 🔒 Day 7                │   │
│  └─────────────────────────┘   │
│                                 │
│  ╭═══════════════════════════╮  │
│  ║   Continue Day 3  →      ║  │
│  ╰═══════════════════════════╯  │
└─────────────────────────────────┘
```

---

### SCREEN 11: Insights (Revised)

```
┌─────────────────────────────────┐
│  Insights                       │
│                                 │
│  ┌─── This Week ─────────────┐  │
│  │  Sessions  Streak  Score  │  │
│  │   ╭───╮    ╭───╮   ╭───╮ │  │
│  │   │ 5 │    │12 │   │ 87│ │  │
│  │   ╰───╯    ╰───╯   ╰───╯ │  │
│  └───────────────────────────┘  │
│                                 │
│  MOOD OVER TIME                 │
│  ┌───────────────────────────┐  │
│  │  (Gold line chart)        │  │
│  │  😊                       │  │
│  │    😊 😊  😊              │  │
│  │  😐  😊 😊 😐  😊        │  │
│  │ 😐 😐                     │  │
│  │  M  T  W  T  F  S  S     │  │
│  └───────────────────────────┘  │
│                                 │
│  CONSISTENCY TREND              │
│  ┌───────────────────────────┐  │
│  │  (Gold bar chart)         │  │
│  │  100 ┤         ╭──╮       │  │
│  │   80 ┤    ╭──╮ │  │ ╭──╮ │  │
│  │   60 ┤ ╭──╯  ╰─╯  ╰─╯  │  │
│  │      └─ W1  W2  W3  W4  │  │
│  └───────────────────────────┘  │
│                                 │
│  ACHIEVEMENTS                   │
│  ┌────┐ ┌────┐ ┌────┐ ┌────┐  │
│  │ 🔥 │ │ 🧠 │ │ ⚡ │ │ 🎯 │  │
│  │ 7d │ │Diag│ │ 5  │ │Done│  │
│  │streak│ │done│ │days │ │prgm│  │
│  └────┘ └────┘ └────┘ └────┘  │
│                                 │
│  ═══════════════════════════    │
│  🏠    📚    📊               │
└─────────────────────────────────┘
```

---

### SCREEN 12: Profile (Revised)

```
┌─────────────────────────────────┐
│  Profile                   ⚙️   │
│                                 │
│        ╭─────────╮              │
│        │  (AV)   │              │
│        ╰─────────╯              │
│      [User Name]               │
│                                 │
│  ┌─────────────────────────┐   │
│  │  YOUR DISCIPLINE DNA    │   │
│  │                         │   │
│  │  Type: The Drifter      │   │
│  │  Block: Perfectionism   │   │
│  │  Secondary: Future Self │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │  STATS                  │   │
│  │  🔥 Best Streak: 23     │   │
│  │  📅 Total Days: 45      │   │
│  │  ✅ Programs Done: 1    │   │
│  │  📊 Avg Mood Score: 3.4 │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Retake Diagnostic  →   │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Subscription           │   │
│  │  Free Trial · 4 days    │   │  ← Or "Active · $29/mo"
│  │  Manage  →              │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Reminder Time          │   │
│  │  7:00 AM          →     │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Sounds & Haptics  →    │   │
│  └─────────────────────────┘   │
│                                 │
│  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─    │
│  ┌─────────────────────────┐   │
│  │  Rate Ember         →   │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Privacy Policy     →   │   │
│  └─────────────────────────┘   │
│                                 │
│        Version 1.0.0            │
└─────────────────────────────────┘
```

---

### SCREEN 13: Paywall (Same as before)
*(Golden particles, feature checklist, Monthly/Yearly toggle, placeholder subscribe button)*

---

## 5. REVISED FILE ARCHITECTURE

```
ember/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_typography.dart
│   │   │   ├── app_spacing.dart
│   │   │   ├── app_radius.dart
│   │   │   ├── app_shadows.dart
│   │   │   ├── app_gradients.dart
│   │   │   ├── app_durations.dart
│   │   │   └── app_strings.dart
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   ├── extensions/
│   │   │   ├── build_context_ext.dart
│   │   │   ├── datetime_ext.dart
│   │   │   └── string_ext.dart
│   │   └── utils/
│   │       ├── haptic_util.dart
│   │       ├── date_util.dart
│   │       └── debounce_util.dart
│   │
│   ├── models/
│   │   ├── user_profile.dart
│   │   ├── discipline_block.dart       ← (Enum + metadata)
│   │   ├── willpower_type.dart         ← (Enum + metadata)
│   │   ├── diagnostic_question.dart
│   │   ├── diagnostic_result.dart
│   │   ├── program.dart
│   │   ├── program_day.dart
│   │   ├── mood_entry.dart
│   │   ├── streak_data.dart
│   │   ├── subscription_state.dart
│   │   └── achievement.dart
│   │
│   ├── services/
│   │   ├── storage_service.dart        ← Hive CRUD
│   │   ├── subscription_service.dart   ← PLACEHOLDER
│   │   ├── notification_service.dart
│   │   └── share_service.dart
│   │
│   ├── providers/
│   │   ├── user_provider.dart
│   │   ├── onboarding_provider.dart
│   │   ├── diagnostic_provider.dart
│   │   ├── program_provider.dart
│   │   ├── daily_protocol_provider.dart
│   │   ├── streak_provider.dart
│   │   ├── mood_provider.dart
│   │   ├── insight_provider.dart
│   │   ├── subscription_provider.dart
│   │   └── settings_provider.dart
│   │
│   ├── widgets/
│   │   ├── animated/
│   │   │   ├── golden_particles_bg.dart
│   │   │   ├── streak_flame.dart
│   │   │   ├── golden_button.dart
│   │   │   ├── animated_counter.dart
│   │   │   ├── confetti_overlay.dart
│   │   │   ├── shimmer_sweep.dart
│   │   │   ├── progress_ring.dart
│   │   │   └── glassmorphic_card.dart
│   │   ├── layout/
│   │   │   ├── app_scaffold.dart
│   │   │   └── gold_bottom_nav.dart     ← 3 tabs now
│   │   ├── cards/
│   │   │   ├── protocol_card.dart
│   │   │   ├── program_card.dart
│   │   │   ├── insight_card.dart
│   │   │   ├── mood_selector.dart
│   │   │   ├── stat_card.dart
│   │   │   └── setting_tile.dart
│   │   ├── quiz/
│   │   │   ├── question_card.dart
│   │   │   └── answer_option.dart
│   │   └── common/
│   │       ├── loading_indicator.dart
│   │       ├── empty_state.dart
│   │       ├── trial_banner.dart
│   │       └── error_view.dart
│   │
│   ├── screens/
│   │   ├── splash/
│   │   │   └── splash_screen.dart
│   │   ├── onboarding/
│   │   │   └── onboarding_screen.dart
│   │   ├── diagnostic/
│   │   │   ├── diagnostic_intro_screen.dart
│   │   │   ├── diagnostic_quiz_screen.dart
│   │   │   ├── diagnostic_analyzing_screen.dart
│   │   │   └── diagnostic_result_screen.dart
│   │   ├── home/
│   │   │   └── home_screen.dart
│   │   ├── protocol/
│   │   │   ├── daily_protocol_screen.dart
│   │   │   └── protocol_complete_screen.dart
│   │   ├── programs/
│   │   │   ├── programs_screen.dart
│   │   │   └── program_detail_screen.dart
│   │   ├── insights/
│   │   │   └── insights_screen.dart
│   │   ├── profile/
│   │   │   └── profile_screen.dart
│   │   └── subscription/
│   │       ├── paywall_screen.dart
│   │       ├── trial_ending_screen.dart
│   │       └── subscribe_success_screen.dart
│   │
│   ├── routes/
│   │   └── app_router.dart
│   │
│   └── data/
│       ├── questions.json                 ← 15 questions
│       ├── blocks.json                    ← Block definitions
│       └── programs/
│           ├── perfectionism_7day.json
│           ├── overwhelm_7day.json
│           ├── willpower_7day.json
│           ├── fear_of_success_7day.json
│           ├── future_self_7day.json
│           ├── task_aversion_7day.json
│           ├── fear_of_failure_7day.json
│           ├── comfort_zone_7day.json
│           ├── attention_7day.json
│           └── identity_7day.json
│
├── assets/
│   ├── lottie/
│   │   ├── ember.json
│   │   ├── flame.json
│   │   ├── inferno.json
│   │   ├── analyzing.json
│   │   └── checkmark.json
│   └── fonts/
│       ├── PlayfairDisplay-Bold.ttf
│       ├── PlayfairDisplay-SemiBold.ttf
│       ├── CormorantGaramond-SemiBold.ttf
│       ├── CormorantGaramond-Italic.ttf
│       ├── Nunito-Regular.ttf
│       ├── Nunito-Medium.ttf
│       ├── Nunito-SemiBold.ttf
│       └── Nunito-Bold.ttf
│
├── pubspec.yaml
└── analysis_options.yaml
```

---

## 6. REVISED DATA MODELS

*(All same as before, EXCEPT remove: `book.dart`, `book_chapter.dart`. Keep all others: DiagnosticResult, SubscriptionState, ProgramProgress, MoodEntry.)*

**Program Day JSON Structure (No book refs):**

```json
{
  "programId": "perfectionism_7day",
  "title": "7-Day Perfectionism Reset",
  "blockId": "perfectionism_paralysis",
  "duration": 7,
  "description": "When everything has to be perfect, nothing gets done. This program dismantles the perfectionism trap one day at a time.",
  "outcomes": [
    "Ship work at 70% without anxiety",
    "Recognize perfectionism as fear, not standards",
    "Build momentum through imperfect action"
  ],
  "days": [
    {
      "day": 1,
      "title": "The Terrible First Draft",
      "insight": "Perfectionism isn't high standards — it's fear disguised as virtue. You're not trying to be excellent; you're trying to avoid the vulnerability of being seen trying.",
      "action": "Do ONE thing badly on purpose today. Send that email without re-reading it twice. Write that messy paragraph. Notice: the world didn't end.",
      "reflectionQuestion": "What did you protect yourself from by not doing this before?"
    },
    {
      "day": 2,
      "title": "The 70% Standard",
      "insight": "The 70% rule: if it's 70% good enough, ship it. The last 30% takes 80% of the time and rarely changes outcomes.",
      "action": "Pick one task you've been overthinking. Do it to 70% and STOP. Walk away. Notice the discomfort — that's your perfectionism, not your standards.",
      "reflectionQuestion": "Where in your life are you spending 80% of effort on the last 30%?"
    }
  ]
}
```

---

## 7. SUBSCRIPTION & NAVIGATION LOGIC

*(Identical to previous plan — 7/14 day placeholder trial, $29/mo placeholder, hard paywall redirect, trial banner logic.)*

---

## 8. THE 10 PROGRAMS FOR MVP

Based on the 10 Discipline Blocks:

1. **Perfectionism 7-Day Reset** (from Books 1, 4, 18)
2. **Overwhelm 7-Day Recovery** (from Books 1, 14)
3. **Future Self 7-Day Connection** (from Book 1)
4. **Willpower 7-Day Rebuild** (from Book 3)
5. **Fear of Success 7-Day Release** (from Book 4)
6. **Task Aversion 7-Day Cure** (from Book 1)
7. **Fear of Failure 7-Day Desensitization** (from Book 1)
8. **Comfort Zone 7-Day Expansion** (from Book 5)
9. **Attention 7-Day Recovery** (from Books 6, 8)
10. **Identity 7-Day Shift** (from Book 20)

**Unlock Logic:**
- User gets their **top 2 matching programs** unlocked for free (during trial)
- Remaining 8 are locked behind subscription
- When trial ends or user taps locked → Paywall

---

## 9. FLUTTER PACKAGES (Revised - Removed book deps)

```yaml
dependencies:
  flutter:
    sdk: flutter

  # ── State & Routing ──
  provider: ^6.1.0
  go_router: ^13.0.0

  # ── Storage ──
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  # ── Animations ──
  flutter_animate: ^4.4.0
  lottie: ^3.0.0
  confetti: ^0.7.0
  shimmer: ^3.0.0

  # ── UI ──
  google_fonts: ^6.1.0

  # ── Charts ──
  fl_chart: ^0.68.0

  # ── Notifications ──
  flutter_local_notifications: ^17.0.0

  # ── Utils ──
  intl: ^0.19.0
  uuid: ^4.3.0
  haptic_feedback: ^0.4.0
  share_plus: ^7.2.0
  path_provider: ^2.1.0
```

---

## 10. BUILD ROADMAP (Revised - Faster without books)

### Phase 1: Foundation (Days 1-2)
```
□ Project setup + packages
□ Full theme system (colors, typography, spacing)
□ GoldenParticlesBg, GlassmorphicCard, GoldenButton widgets
□ GoRouter + all route stubs
□ Hive setup + SubscriptionService (placeholder)
□ Navigation guards
```

### Phase 2: Diagnostic (Days 3-4)
```
□ questions.json + blocks.json
□ DiagnosticProvider + scoring algorithm
□ Splash → Onboarding → Quiz → Analyzing → Result
```

### Phase 3: Core Loop (Days 5-7)
```
□ First 2 programs as JSON (Perfectionism + Overwhelm)
□ ProgramProvider + DailyProtocolProvider
□ Home screen (streak + today's card)
□ Daily Protocol screen (insight + action + mood)
□ Protocol Complete screen (confetti)
□ StreakProvider + MoodProvider
```

### Phase 4: Programs & Paywall (Days 8-9)
```
□ Remaining 8 programs as JSON
□ Programs screen (categories + shimmer locks)
□ Program Detail screen
□ Paywall screen + placeholder subscribe
□ Lock logic (tap locked → paywall)
```

### Phase 5: Insights & Profile (Days 10-11)
```
□ Insights screen (charts + stats + badges)
□ Profile screen (DNA + stats + settings)
□ NotificationService + reminder time
□ ShareService (share wins)
```

### Phase 6: Polish & Launch (Days 12-14)
```
□ All micro-interactions + haptics
□ All page transitions
□ Empty states + error handling
□ App icon + store listing
□ Google Play publish
```

---

Clean, focused, no half-finished features. Just the diagnostic + prescription loop, polished to a golden mirror shine.

