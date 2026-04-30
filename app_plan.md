# EMBER — Full Flutter App Plan
### *The Discipline Diagnostic*

---

## 1. IDENTITY & VISION

**Working Name:** Ember
**Tagline:** *"Find your block. Fix your discipline."*
**Positioning:** Not a habit tracker. A precision diagnostic tool for behavior change. Competes with coaching ($200+/month), not other apps ($3/month).
**Design Philosophy:** Dark luxury. Warm gold on deep black. Every screen feels like holding a premium leather-bound book in a candlelit room.

---

## 2. DESIGN SYSTEM

### 2.1 Color Palette — "Golden Hour"

```
╔══════════════════════════════════════════════════════╗
║                    BACKGROUNDS                       ║
╠══════════════════════════════════════════════════════╣
║  Scaffold BG    #110F0D   ████████  Deepest warm     ║
║  Surface        #1A1612   ████████  Primary surface   ║
║  Card           #241F1A   ████████  Cards/elevated    ║
║  Card Hover     #2E2822   ████████  Pressed/selected  ║
║  Elevated       #3A322B   ████████  Modals/bottom     ║
║  Input Fill     #1E1915   ████████  Text fields       ║
╠══════════════════════════════════════════════════════╣
║                    GOLD ACCENTS                       ║
╠══════════════════════════════════════════════════════╣
║  Gold 100       #FFF5DB   ████████  Brightest gold    ║
║  Gold 200       #F0DCA0   ████████  Light highlight   ║
║  Gold 300       #E8C87A   ████████  Primary gold      ║
║  Gold 400       #D4A853   ████████  THE GOLD          ║
║  Gold 500       #B8892E   ████████  Darker gold       ║
║  Gold 600       #9A7124   ████████  Borders/subtle    ║
║  Gold 700       #7A591C   ████████  Disabled gold     ║
╠══════════════════════════════════════════════════════╣
║                    WARM ACCENTS                       ║
╠══════════════════════════════════════════════════════╣
║  Amber          #E89B3E   ████████  Warning/attention ║
║  Burnt Orange   #C4652A   ████████  Streak/fire       ║
║  Deep Ember     #8B3A1A   ████████  Gradient end      ║
║  Warm Red       #C44B4B   ████████  Error/danger      ║
║  Warm Green     #5B9E5B   ████████  Success/complete  ║
║  Warm Blue      #5B8EC4   ████████  Info (rare use)   ║
╠══════════════════════════════════════════════════════╣
║                       TEXT                           ║
╠══════════════════════════════════════════════════════╣
║  Text Primary   #F2E8D8   ████████  Headings/body     ║
║  Text Secondary #B0A292   ████████  Captions/meta     ║
║  Text Tertiary  #7A6E62   ████████  Placeholders      ║
║  Text Disabled  #5A5048   ████████  Disabled states   ║
║  Text On Gold   #1A1612   ████████  Text ON gold btn  ║
╠══════════════════════════════════════════════════════╣
║                    GRADIENTS                         ║
╠══════════════════════════════════════════════════════╣
║  Gold Primary   D4A853 → E89B3E   (buttons, accents)  ║
║  Gold Deep      D4A853 → 8B3A1A   (streak, fire)     ║
║  Gold Subtle    D4A85315 → 00000000 (card glow)       ║
║  BG Radial      #1A1612 → #110F0D  (screen bg)        ║
╚══════════════════════════════════════════════════════╝
```

### 2.2 Typography

```
╔═══════════════════════════════════════════════════════════╗
║  ROLE           FONT                 SIZE    WEIGHT      ║
╠═══════════════════════════════════════════════════════════╣
║  Display Hero   Playfair Display    36sp    Bold 700     ║
║  Heading XL     Playfair Display    28sp    SemiBold 600 ║
║  Heading LG     Playfair Display    22sp    SemiBold 600 ║
║  Heading MD     Cormorant Garamond  18sp    SemiBold 600 ║
║  Body LG        Nunito              16sp    Regular 400  ║
║  Body MD        Nunito              14sp    Regular 400  ║
║  Body SM        Nunito              12sp    Regular 400  ║
║  Caption        Nunito              11sp    Regular 400  ║
║  Label          Nunito              12sp    Medium 500   ║
║  Label Bold     Nunito              12sp    SemiBold 600 ║
║  Number XL      Nunito (tabular)    32sp    Bold 700     ║
║  Number LG      Nunito (tabular)    24sp    Bold 700     ║
║  Number MD      Nunito (tabular)    18sp    SemiBold 600 ║
║  Quote          Cormorant Garamond  20sp    Italic 400   ║
║  Source Ref     Nunito              11sp    Regular 400  ║
╚═══════════════════════════════════════════════════════════╝
```

### 2.3 Spacing Scale

```dart
class AppSpacing {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 40;
  static const double massive = 48;
  static const double screen = 64;
}
```

### 2.4 Border Radius

```dart
class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double full = 100;
}
```

### 2.5 Shadows (Warm, never cold gray)

```dart
class AppShadows {
  static final card = BoxShadow(
    color: Color(0x1A000000),  // warm black
    offset: Offset(0, 2),
    blur: 8,
  );
  static final cardHover = BoxShadow(
    color: Color(0x2A000000),
    offset: Offset(0, 4),
    blur: 16,
  );
  static final goldGlow = BoxShadow(
    color: Color(0x33D4A853),  // gold with low opacity
    offset: Offset(0, 0),
    blur: 20,
  );
  static final goldGlowStrong = BoxShadow(
    color: Color(0x55D4A853),
    offset: Offset(0, 0),
    blur: 30,
  );
}
```

---

## 3. ANIMATION SYSTEM

### 3.1 Animation Catalog

```
╔══════════════════════════════════════════════════════════════════╗
║  ANIMATION                    DURATION  CURVE            USE   ║
╠══════════════════════════════════════════════════════════════════╣
║  Gold Fade In                  400ms    easeInOutCubic    Text  ║
║  Gold Slide Up                 500ms    easeOutCubic      Cards ║
║  Gold Slide Right              400ms    easeOutQuart      Quiz  ║
║  Gold Slide Left (exit)        300ms    easeInQuart       Quiz  ║
║  Scale In (pop)                350ms    easeOutBack       Btns  ║
║  Scale Down (press)            100ms    easeInOutQuad     Btns  ║
║  Number Count Up               800ms    easeOutCubic      Stats ║
║  Streak Flame Flicker          Loop     customSine        Flame ║
║  Golden Shimmer Sweep          2000ms   linear            Locked║
║  Confetti Burst                1500ms   easeOutCubic      Done  ║
║  Golden Ring Fill              600ms    easeInOutCubic    Progr ║
║  Card Flip                     500ms    easeInOutCubic    Reveal║
║  Breathing Circle              4000ms   easeInOutSine     Relax ║
║  Particle Float                Loop     customSine        BG    ║
║  Glass Blur In                 300ms    easeOutCubic      Modal ║
║  Haptic Tap                    -        -                 Btns  ║
║  Haptic Success                -        -                 Done  ║
║  Haptic Heavy                  -        -                 Mile  ║
╚══════════════════════════════════════════════════════════════════╝
```

### 3.2 Page Transitions

```dart
// Standard: Fade + slight scale up
class GoldFadeTransition extends PageRouteBuilder {
  // fade 0→1, scale 0.95→1.0 over 400ms
}

// Quiz: Horizontal slide
class QuizSlideTransition extends PageRouteBuilder {
  // new: slideX 1.0→0.0
  // old: slideX 0.0→-0.3 + fade 1→0
}

// Result Reveal: Dramatic
class RevealTransition extends PageRouteBuilder {
  // fade 0→1, scale 0.8→1.0 over 600ms, easeOutBack
  // golden shimmer sweeps across during transition
}

// Protocol Complete: Celebration
class CelebrationTransition extends PageRouteBuilder {
  // normal transition + confetti overlay fires at 50% point
}
```

### 3.3 Golden Particles Background

```dart
class GoldenParticlesBackground extends StatefulWidget {
  // 30 particles
  // Each: x, y, speed (0.2-0.8), opacity (0.05-0.25), size (1.5-3.5)
  // Movement: drift upward + sinusoidal horizontal sway
  // When particle.y < 0: respawn at bottom with new random x
  // Paint with gold gradient (Gold300 → Gold500)
  // Runs on single AnimationController at 60fps
  // Pauses when app is backgrounded
  // Used on: Splash, Home, Diagnostic Result, Paywall
}
```

### 3.4 Streak Flame Widget

```dart
class StreakFlame extends StatelessWidget {
  // Uses Lottie animation (custom or from LottieFiles)
  // 3 stages:
  //   1-6 days:   "ember.json"   (small flicker)
  //   7-29 days:  "flame.json"   (medium flame)
  //   30+ days:   "inferno.json" (large roaring flame)
  // Colors tinted to gold gradient
  // Haptic feedback when streak increments
}
```

### 3.5 Glassmorphic Card

```dart
class GlassmorphicCard extends StatelessWidget {
  // Container with:
  //   decoration: BoxDecoration(
  //     color: Card color with 0.6 opacity,
  //     borderRadius: 16,
  //     border: Border.all(color: Gold400 with 0.15 opacity),
  //   )
  //   child: ClipRRect + BackdropFilter(blur: 20, filter: ImageFilter.blur)
  //   child: content
  //
  // On tap: scale 0.98 → 1.0 with spring
  // On long press: subtle gold glow intensifies
}
```

---

## 4. SCREEN-BY-SCREEN BLUEPRINTS

### SCREEN 1: Splash

```
┌─────────────────────────────────┐
│                                 │
│         (dark bg #110F0D)       │
│                                 │
│        ╭─────────────╮          │
│        │   🔥 EMBER  │          │ ← Logo fades in (400ms)
│        ╰─────────────╯          │
│                                 │
│     ✦  ✦     ✦     ✦   ✦      │ ← Golden particles
│   ✦      ✦    ✦  ✦      ✦     │    drifting upward
│     ✦  ✦     ✦     ✦   ✦      │
│                                 │
│    Find your block.             │ ← Text fades in (delay 600ms)
│    Fix your discipline.         │
│                                 │
│         ◠ golden line ◡         │ ← Animated line draws (800ms)
│                                 │
└─────────────────────────────────┘

Duration: 2.5 seconds total, then auto-navigate
```

### SCREEN 2: Onboarding (3 Pages)

```
PAGE 1                          PAGE 2
┌─────────────────────┐         ┌─────────────────────┐
│                     │         │                     │
│  (skip)         1/3 │         │  (skip)         2/3 │
│                     │         │                     │
│   "You're not       │         │   ┌───┐ ┌───┐      │
│    lazy."           │         │   │ 🧠│→│🔧│      │
│                     │         │   └───┘ └───┘      │
│   (animated text    │         │                     │
│    reveal letter    │         │   "Most people     │
│    by letter)       │         │    fail because    │
│                     │         │    they treat the  │
│   Subtitle about    │         │    wrong problem." │
│   procrastination   │         │                     │
│   not being laziness│         │   Shows diagnostic │
│                     │         │   concept visually │
│   ─── ○ ○ ───       │         │                     │
│   Continue →        │         │   ─── ● ○ ───       │
│                     │         │   Continue →        │
└─────────────────────┘         └─────────────────────┘

PAGE 3
┌─────────────────────┐
│                     │
│  (skip)         3/3 │
│                     │
│   "Get your         │
│    prescription."   │
│                     │
│   ┌─────────────┐   │
│   │ Day 1: Do X │   │  ← Animated program preview
│   │ Day 2: Do Y │   │     scrolls vertically
│   │ Day 3: Do Z │   │
│   │ ...         │   │
│   └─────────────┘   │
│                     │
│   "Based on 30 books│
│    of research."    │
│                     │
│   ─── ○ ● ───       │
│   Take the Quiz →   │  ← Gold gradient button
│                     │
└─────────────────────┘

Swipe left/right to navigate. Dot indicators gold.
"Take the Quiz" = full-width gold gradient button with text on dark.
```

### SCREEN 3: Diagnostic Quiz

```
┌─────────────────────────────────┐
│  ← Back            Question 3/15│
│                                 │
│  ╭─── Golden Progress Ring ───╮ │  ← Animated ring
│  │      ╭────╮                 │ │     fills as you
│  │      │ 20%│                 │ │     answer
│  │      ╰────╯                 │ │
│  ╰─────────────────────────────╯ │
│                                 │
│  ┌─────────────────────────┐   │
│  │                         │   │
│  │  "When you face a big   │   │  ← Current card
│  │   task, what happens    │   │     (slides in from right)
│  │   in your mind first?"  │   │
│  │                         │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌───────────┐  ┌───────────┐   │
│  │ A         │  │ B         │   │  ← Answer cards
│  │ "I feel   │  │ "I see    │   │     stack visually
│  │  overwhelmed│ │  the whole │   │     (slight offset)
│  │  and stuck"│ │  mountain" │   │
│  └───────────┘  └───────────┘   │
│  ┌───────────┐  ┌───────────┐   │
│  │ C         │  │ D         │   │
│  │ "I worry  │  │ "I just   │   │
│  │  it won't │  │  can't    │   │
│  │  be good" │  │  start"   │   │
│  └───────────┘  └───────────┘   │
│                                 │
│  ✦  ✦  ✦  ✦  ✦  ✦  ✦  ✦  ✦   │  ← Particles react
│                                 │     to tap (burst)
└─────────────────────────────────┘

INTERACTION:
- Tap answer → card scales 0.95 briefly, then slides out left
- Next question slides in from right (400ms)
- Progress ring animates
- Particles burst outward from tap point
- Haptic: light tap
- NO "next" button — tap answer = advance
```

### SCREEN 4: Analyzing (Transition)

```
┌─────────────────────────────────┐
│                                 │
│         (particles speed up)    │
│                                 │
│           ╭─────╮               │
│           │ ◠◡◠ │               │  ← Golden spinning ring
│           │  ✦  │               │     (Lottie or custom)
│           ╰─────╯               │
│                                 │
│    "Analyzing your patterns"    │  ← Text cycles through:
│                                 │     "Analyzing your patterns..."
│                                 │     "Identifying your block..."
│                                 │     "Preparing your prescription..."
│                                 │     (each phrase 1.5s, crossfade)
│                                 │
│    ◠ ◡ ◠ ◡ ◠ ◡ ◠ ◡ ◠ ◡ ◠ ◡   │  ← Animated dots
│                                 │
│         (particles slow down)   │
│                                 │
└─────────────────────────────────┘

Duration: 4 seconds, then auto-navigate to Result
```

### SCREEN 5: Diagnostic Result (THE KEY MOMENT)

```
┌─────────────────────────────────┐
│                                 │
│         (golden particles)      │
│                                 │
│    Your #1 Discipline Block     │  ← Fades in first
│                                 │
│    ──── ◆ ────                  │  ← Golden line draws
│                                 │
│                                 │
│     PERFECTIONISM               │  ← Display Hero
│       PARALYSIS                 │     Playfair Display 36sp
│                                 │     Gold 300 color
│                                 │     Scales in from 0.8→1.0
│                                 │     with easeOutBack
│                                 │
│    "You don't lack motivation   │  ← Fades in (delay 400ms)
│     — you're protecting         │
│     yourself from the           │
│     vulnerability of            │
│     imperfect work."            │
│                                 │
│     — Why You're Not Lazy, Ch2  │  ← Source reference
│       Gold 600 color            │
│                                 │
│  ┌─────────────────────────┐   │
│  │  YOUR SECONDARY BLOCK   │   │  ← Glassmorphic card
│  │  Future Self Disconnect  │   │     fades in (delay 800ms)
│  │  Willpower Type: Drifter│   │
│  └─────────────────────────┘   │
│                                 │
│  ╭═══════════════════════════╮  │
│  ║  Start Your 7-Day Reset → ║  │  ← Gold gradient button
│  ╰═══════════════════════════╯  │     fades in (delay 1200ms)
│                                 │
└─────────────────────────────────┘

THIS SCREEN IS THE VIRAL MOMENT.
Users WILL screenshot this. Design accordingly.
```

### SCREEN 6: Home

```
┌─────────────────────────────────┐
│  Good morning        🔔  👤    │  ← Top bar
│  [user name]                    │     Avatar = gold circle
│                                 │     Bell = notification icon
│  ┌─────────────────────────┐   │
│  │ 🔥 12 days              │   │  ← Streak card
│  │ Your longest: 23 days   │   │     Flame animation
│  │ ═════════════░░░░░░░░░  │   │     Gold progress bar
│  └─────────────────────────┘   │
│                                 │
│  TODAY'S PROTOCOL               │  ← Section heading
│                                 │
│  ┌─────────────────────────┐   │
│  │  Day 3 of 7             │   │  ← TODAY'S CARD
│  │  "The 70% Standard"     │   │     (prominent, gold border)
│  │                         │   │
│  │  "The last 30% takes    │   │     Subtle golden glow
│  │   80% of the time and   │   │     shadow underneath
│  │   rarely changes        │   │
│  │   outcomes."            │   │
│  │                         │   │
│  │  — The Grit Equation    │   │
│  │                         │   │
│  │  ╭═══════════════════╮  │   │
│  │  ║  Begin Session  →  ║  │   │  ← Tap → Protocol screen
│  │  ╰═══════════════════╯  │   │
│  └─────────────────────────┘   │
│                                 │
│  YOUR PROGRAMS                  │
│  ┌──────┐ ┌──────┐ ┌──────┐   │  ← Horizontal scroll
│  │ 🔒   │ │ 🔄  │ │ ✅   │   │     of program cards
│  │ Fear │ │Focus │ │Perf  │   │
│  │ 14d  │ │30d  │ │ 7d   │   │     Locked = shimmer
│  │ Day 5│ │Day 12│ │Done  │   │     Active = gold border
│  └──────┘ └──────┘ └──────┘   │     Done = green check
│                                 │
│  ═══════════════════════════    │
│  🏠    📚    📖    📊          │  ← Bottom nav
│  Home  Progs  Library Insights │     Gold active indicator
│                                 │
│  ┌─────────────────────────┐   │  ← Trial banner (if applicable)
│  │ ⏰ 4 days left in trial │   │     Warm amber background
│  │ View Plans →            │   │     Dismissible
│  └─────────────────────────┘   │
└─────────────────────────────────┘

INTERACTIONS:
- Streak flame: tap to see streak history
- Today's Protocol card: subtle golden pulse animation (glow breathes)
- Program cards: horizontal drag with snap
- Bottom nav: gold dot slides to active tab (AnimatedContainer)
- Pull down: golden sparkle refresh
- Trial banner: swipe to dismiss, returns after 24h
```

### SCREEN 7: Daily Protocol (THE CORE EXPERIENCE)

```
┌─────────────────────────────────┐
│  ← Back          Day 3 of 7    │
│                                 │
│  ╭─── progress dots ───╮       │
│  │ ● ● ● ○ ○ ○ ○      │       │  ← Gold filled = done
│  ╰─────────────────────╯       │     Empty = upcoming
│                                 │
│                                 │
│     "The 70% Standard"         │  ← Heading
│       (Playfair Display 28sp)  │     Gold 300
│                                 │
│                                 │
│  ┌─────────────────────────┐   │
│  │                         │   │
│  │  "The last 30% of      │   │  ← Insight card
│  │   perfection takes     │   │     Glassmorphic
│  │   80% of your time     │   │     Serif quote font
│  │   and rarely changes   │   │     Centered text
│  │   the outcome.         │   │     Gold 300 accent
│  │                         │   │
│  │   Ship at 70%. The     │   │
│  │   world rewards done,  │   │
│  │   not perfect."        │   │
│  │                         │   │
│  └─────────────────────────┘   │
│                                 │
│  — The Grit Equation, Ch 5     │  ← Source
│                                 │
│  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─   │
│                                 │
│  TODAY'S ACTION                 │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Pick one task you've   │   │  ← Action card
│  │  been overthinking.     │   │     Slightly different
│  │  Do it to 70% and       │   │     bg (warmer)
│  │  STOP. Walk away.       │   │
│  │                         │   │
│  │  Notice the discomfort  │   │
│  │  — that's your          │   │
│  │  perfectionism, not     │   │
│  │  your standards.        │   │
│  └─────────────────────────┘   │
│                                 │
│  HOW DID IT FEEL?               │  ← After marking done
│                                 │
│  ┌────┐ ┌────┐ ┌────┐ ┌────┐  │  ← Mood selector
│  │ 😤 │ │ 😐 │ │ 🤔 │ │ 😊 │  │     Each is a circle
│  │Hard │ │Meh │ │Weird│ │Free │  │     Tap = gold ring
│  └────┘ └────┘ └────┘ └────┘  │     + haptic
│                                 │
│  ╭═══════════════════════════╮  │
│  ║     ✓ I Did It Today     ║  │  ← COMPLETE button
│  ╰═══════════════════════════╯  │     Disabled until mood
│                                 │     selected (gold → muted)
│                                 │
└─────────────────────────────────┘

ON COMPLETION:
1. Button scales 0.95 → 1.0 (100ms)
2. Button fills with gold gradient (300ms)
3. Screen flashes gold at 30% opacity (200ms)
4. Confetti bursts from button position (1500ms)
5. Haptic: success
6. Auto-navigate to completion screen after 1.5s
```

### SCREEN 8: Protocol Complete

```
┌─────────────────────────────────┐
│                                 │
│         ✦ confetti ✦           │
│         ✦  falling ✦           │
│         ✦   down   ✦           │
│                                 │
│           ╭─────╮               │
│           │  ✓  │               │  ← Gold checkmark
│           ╰─────╯               │     Scale in with easeOutBack
│                                 │
│      Day 3 Complete             │  ← Fade in
│                                 │
│    🔥 12 day streak             │  ← Streak with flame
│                                 │
│  ┌─────────────────────────┐   │
│  │  REFLECTION              │   │  ← Optional reflection
│  │                         │   │
│  │  "What did you protect  │   │
│  │   yourself from by not  │   │
│  │   doing this before?"   │   │
│  │                         │   │
│  │  ┌─────────────────┐   │   │
│  │  │ Type here...    │   │   │  ← Text field
│  │  └─────────────────┘   │   │     Dark input bg
│  └─────────────────────────┘   │
│                                 │
│  ╭═══════════════════════════╮  │
│  ║     Continue to Day 4  →  ║  │
│  ╰═══════════════════════════╯  │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Share your win 🔗      │   │  ← Share button
│  └─────────────────────────┘   │     (generates image)
│                                 │
└─────────────────────────────────┘

SHARE IMAGE:
Dark background + gold text:
"Day 3 of the Perfectionism Reset ✓
🔥 12 day streak
#EmberApp #DisciplineDiagnostic"
```

### SCREEN 9: Programs Library

```
┌─────────────────────────────────┐
│  Programs                  🔍   │
│                                 │
│  ╭─ CORE RESETS ─────────────╮  │
│  │                            │  │
│  │ ┌──────────────────────┐  │  │
│  │ │ ✅ Perfectionism 7-Day│  │  │  ← Completed = green
│  │ │    Completed          │  │  │     check + muted
│  │ └──────────────────────┘  │  │
│  │ ┌──────────────────────┐  │  │
│  │ │ 🔄 Focus 30-Day      │  │  │  ← Active = gold border
│  │ │    Day 12/30          │  │     + progress bar
│  │ │    ═══════░░░░░░░░░  │  │  │
│  │ └──────────────────────┘  │  │
│  │ ┌──────────────────────┐  │  │
│  │ │ 🔒 Overwhelm 7-Day  │  │  │  ← Locked = gold shimmer
│  │ │    ◆◆◆◆◆◆◆◆◆◆        │  │     sweep animation
│  │ └──────────────────────┘  │  │
│  │ ┌──────────────────────┐  │  │
│  │ │ 🔒 Willpower 7-Day   │  │  │
│  │ └──────────────────────┘  │  │
│  │ ┌──────────────────────┐  │  │
│  │ │ 🔒 Fear of Success   │  │  │
│  │ └──────────────────────┘  │  │
│  ╰────────────────────────────╯  │
│                                 │
│  ╭─ DEEP PROGRAMS ───────────╮  │
│  │ ┌──────────┐┌──────────┐  │  │  ← 2-column grid
│  │ │ 🔒       ││ 🔒       │  │  │
│  │ │Discipline││Habit     │  │  │
│  │ │30-Day    ││30-Day    │  │  │
│  │ └──────────┘└──────────┘  │  │
│  │ ┌──────────┐┌──────────┐  │  │
│  │ │ 🔒       ││ 🔒       │  │  │
│  │ │Mindset   ││Motivation│  │  │
│  │ │30-Day    ││30-Day    │  │  │
│  │ └──────────┘└──────────┘  │  │
│  ╰────────────────────────────╯  │
│                                 │
│  ╭─ SPECIALIZED ─────────────╮  │
│  │ ┌──────┐┌──────┐┌──────┐ │  │
│  │ │ 🔒   ││ 🔒   ││ 🔒   │ │  │
│  │ │Entre-││Student││Parent │ │  │
│  │ │preneur││       ││       │ │  │
│  │ └──────┘└──────┘└──────┘ │  │
│  │ ┌──────┐┌──────┐         │  │
│  │ │ 🔒   ││ 🔒   │         │  │
│  │ │Athlete││Creative│        │  │
│  │ └──────┘└──────┘         │  │
│  ╰────────────────────────────╯  │
│                                 │
│  ═══════════════════════════    │
│  🏠    📚    📖    📊          │
└─────────────────────────────────┘

TAP LOCKED CARD:
→ Full-screen paywall appears (if in trial)
→ "Unlock all 30 programs" message
```

### SCREEN 10: Program Detail

```
┌─────────────────────────────────┐
│  ← Back                        │
│                                 │
│  ┌─────────────────────────┐   │
│  │  (golden gradient bg)   │   │
│  │                         │   │
│  │  30-Day Focus Challenge │   │  ← Program title
│  │                         │   │
│  │  Rebuild your attention │   │  ← Subtitle
│  │  span from scratch      │   │
│  │                         │   │
│  │  Based on: Book 27      │   │  ← Source book
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Your Block Match: 94%  │   │  ← Relevance score
│  │  ══════════════════░░░  │   │     (from diagnostic)
│  └─────────────────────────┘   │
│                                 │
│  WHAT YOU'LL BUILD              │
│  • Sustained attention           │
│  • Digital discipline            │
│  • Deep work capacity            │
│  • Focus stamina                 │
│                                 │
│  WEEK BY WEEK                   │
│  ┌─── Week 1 ───────────────┐  │
│  │ ✅ Day 1: Sleep Audit    │  │
│  │ ✅ Day 2: Sleep Hygiene  │  │
│  │ ✅ Day 3: Nutrition      │  │
│  │ ...                      │  │
│  └──────────────────────────┘  │
│  ┌─── Week 2 ───────────────┐  │
│  │ 🔒 Day 8-14              │  │
│  └──────────────────────────┘  │
│  ┌─── Week 3 ───────────────┐  │
│  │ 🔒 Day 15-21             │  │
│  └──────────────────────────┘  │
│  ┌─── Week 4 ───────────────┐  │
│  │ 🔒 Day 22-30             │  │
│  └──────────────────────────┘  │
│                                 │
│  ╭═══════════════════════════╮  │
│  ║   Continue Day 13  →      ║  │  ← Or "Start Program"
│  ╰═══════════════════════════╯  │
└─────────────────────────────────┘
```

### SCREEN 11: Book Library

```
┌─────────────────────────────────┐
│  Library                  🔍   │
│                                 │
│  30 Books of Discipline         │
│                                 │
│  ╭─ YOUR PRESCRIPTION ────────╮  │
│  │ ┌─────┐ ┌─────┐ ┌─────┐  │  │  ← Horizontal scroll
│  │ │ Book│ │ Book│ │ Book│  │  │     Books matching
│  │ │  1  │ │  4  │ │ 18  │  │  │     user's diagnostic
│  │ │ ★   │ │ ★   │ │ ★   │  │  │     Gold star = recommended
│  │ └─────┘ └─────┘ └─────┘  │  │
│  ╰────────────────────────────╯  │
│                                 │
│  ╭─ ALL BOOKS ────────────────╮  │
│  │ ┌───────────────────────┐  │  │
│  │ │ 01  Why You're Not    │  │  │  ← List view
│  │ │     Lazy              │  │  │     Each row: number +
│  │ │     5 chapters · ★    │  │  │     title + chapters
│  │ └───────────────────────┘  │  │     + gold star if
│  │ ┌───────────────────────┐  │  │     recommended
│  │ │ 02  The Motivation    │  │  │
│  │ │     Myth              │  │  │
│  │ │     5 chapters        │  │  │
│  │ └───────────────────────┘  │  │
│  │ ┌───────────────────────┐  │  │
│  │ │ 03  Willpower Is a    │  │  │
│  │ │     Muscle            │  │  │
│  │ │     5 chapters · ★    │  │
│  │ └───────────────────────┘  │  │
│  │         ...                │  │
│  │ ┌───────────────────────┐  │  │
│  │ │ 30  The 30-Day        │  │  │
│  │ │     Motivation Booster│  │  │
│  │ │     5 chapters        │  │  │
│  │ └───────────────────────┘  │  │
│  ╰────────────────────────────╯  │
│                                 │
│  ═══════════════════════════    │
│  🏠    📚    📖    📊          │
└─────────────────────────────────┘
```

INTERACTIONS:
- Tap paragraph → golden highlight with smooth animation
- Bookmark → gold ribbon drops from top (Lottie)
- Font size → bottom sheet with 3 size options
- Long press word → could show definition (future feature)
- Turn page: horizontal drag with parallax (next page peeks in from right)
```

### SCREEN 13: Insights

```
┌─────────────────────────────────┐
│  Insights                       │
│                                 │
│  ┌─── This Week ─────────────┐  │
│  │                           │  │
│  │  Sessions  Streak  Score  │  │
│  │   ╭───╮    ╭───╮   ╭───╮ │  │
│  │   │ 5 │    │12 │   │ 87│ │  │  ← Animated counters
│  │   ╰───╯    ╰───╯   ╰───╯ │  │     Numbers count up
│  │   days     days    pts    │  │     on screen enter
│  │                           │  │
│  └───────────────────────────┘  │
│                                 │
│  MOOD OVER TIME                 │
│  ┌───────────────────────────┐  │
│  │                           │  │
│  │  😊                       │  │
│  │    😊 😊  😊              │  │  ← fl_chart line chart
│  │  😐  😊 😊 😐  😊        │  │     Gold line color
│  │ 😐 😐                     │  │     Gold dots at points
│  │  M  T  W  T  F  S  S     │  │     Dark grid lines
│  │                           │  │
│  └───────────────────────────┘  │
│                                 │
│  DISCIPLINE SCORE TREND         │
│  ┌───────────────────────────┐  │
│  │  90 ┤                     │  │
│  │  80 ┤         ╭──╮        │  │  ← Bar chart
│  │  70 ┤    ╭──╮ │  │ ╭──╮  │  │     Gold gradient bars
│  │  60 ┤ ╭──╯  ╰─╯  ╰─╯  │  │
│  │     └─ W1  W2  W3  W4   │  │
│  └───────────────────────────┘  │
│                                 │
│  ACHIEVEMENTS                   │
│  ┌────┐ ┌────┐ ┌────┐ ┌────┐  │
│  │ 🔥 │ │ 📖 │ │ ⚡ │ │ 🎯 │  │  ← Badge grid
│  │ 7d │ │ 3  │ │ 5  │ │Done│  │  ← Locked = grayed
│  │streak│ │books│ │days │ │prgm│  │     Unlocked = gold
│  └────┘ └────┘ └────┘ └────┘  │
│                                 │
│  ═══════════════════════════    │
│  🏠    📚    📖    📊          │
└─────────────────────────────────┘
```

### SCREEN 14: Profile

```
┌─────────────────────────────────┐
│  Profile                   ⚙️   │
│                                 │
│        ╭─────────╮              │
│        │  (AV)   │              │  ← Gold circle avatar
│        ╰─────────╯              │     with initials
│                                 │
│      [User Name]               │
│                                 │
│  ┌─────────────────────────┐   │
│  │  YOUR DISCIPLINE DNA    │   │
│  │                         │   │
│  │  Type: The Drifter      │   │  ← From Book 3
│  │  Block: Perfectionism   │   │
│  │  Secondary: Future Self │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │  STATS                  │   │
│  │  🔥 Best Streak: 23     │   │
│  │  📅 Total Days: 45      │   │
│  │  📚 Books Read: 3       │   │
│  │  ✅ Programs Done: 1    │   │
│  │  📊 Avg Score: 84       │   │
│  └─────────────────────────┘   │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Retake Diagnostic  →   │   │  ← Gold arrow
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Subscription           │   │
│  │  Active · $29/mo        │   │  ← Or "Free Trial"
│  │  Manage  →              │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Notification Time      │   │
│  │  7:00 AM          →     │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Sounds            →    │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Haptics           →    │   │
│  └─────────────────────────┘   │
│                                 │
│  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─    │
│                                 │
│  ┌─────────────────────────┐   │
│  │  Rate Ember         →   │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Share with Friend  →   │   │
│  └─────────────────────────┘   │
│  ┌─────────────────────────┐   │
│  │  Privacy Policy     →   │   │
│  └─────────────────────────┘   │
│                                 │
│        Version 1.0.0            │
│                                 │
└─────────────────────────────────┘
```

### SCREEN 15: Paywall (THE MONEY SCREEN)

```
┌─────────────────────────────────┐
│  ✕                             │  ← Close (but trial
│                                 │     users can't close)
│         (golden particles)      │
│                                 │
│      Your discipline            │
│      deserves more than         │
│      willpower.                 │  ← Playfair Display
│                                 │     Gold 300
│  ──── ◆ ────                   │
│                                 │
│  UNLOCK EVERYTHING              │
│                                 │
│  ✓  All 30 programs            │  ← Gold checkmarks
│                                 │     animate in
│  ✓  Advanced diagnostics       │     sequentially
│  ✓  Discipline DNA analysis    │     (stagger 100ms)
│  ✓  Progress analytics         │
│  ✓  New programs monthly       │
│  ✓  Prescription refreshes     │
│                                 │
│  ┌─────────────────────────┐   │
│  │  ○  Monthly    $29/mo   │   │  ← Selected = gold ring
│  │     Billed monthly      │   │
│  ├─────────────────────────┤   │
│  │  ○  Yearly   $239/yr    │   │  ← "Save $109"
│  │     $19.92/mo · Save   │   │     Gold badge
│  │     $109                │   │
│  └─────────────────────────┘   │
│                                 │
│  ╭═══════════════════════════╮  │
│  ║  Start 7-Day Free Trial  ║  │  ← BIG gold gradient
│  ║  then $29/month          ║  │     button
│  ╰═══════════════════════════╯  │
│                                 │
│  Cancel anytime. No charge      │  ← Small text
│  during trial.                  │     Tertiary color
│                                 │
│  "Less than therapy.            │  ← Social proof
│   More than a book."           │
│                                 │
│  Restore Purchase               │
│  Terms · Privacy                │
│                                 │
└─────────────────────────────────┘

IF TRIAL EXPIRED (hard paywall):
- Remove "Start 7-Day Free Trial"
- Change to "Subscribe Now — $29/month"
- Add "Your progress is waiting" above button
- Cannot close this screen (no ✕ button)
- Full screen, no way back except subscribe

PLACEHOLDER BEHAVIOR:
- User taps "Start Free Trial"
- Shows loading spinner (2 seconds)
- Shows "Subscription Active!" success screen
- Stores `isSubscribed: true` + `trialStartDate` in Hive
- Navigates to Home
```

---

## 5. FILE ARCHITECTURE

```
ember/
├── lib/
│   ├── main.dart                          ← Entry point
│   ├── app.dart                           ← MaterialApp + GoRouter
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart            ← All color definitions
│   │   │   ├── app_typography.dart        ← Text styles
│   │   │   ├── app_spacing.dart           ← Spacing values
│   │   │   ├── app_radius.dart            ← Border radius
│   │   │   ├── app_shadows.dart           ← Box shadows
│   │   │   ├── app_gradients.dart         ← LinearGradient defs
│   │   │   ├── app_durations.dart         ← Animation durations
│   │   │   └── app_strings.dart           ← All UI strings
│   │   ├── theme/
│   │   │   └── app_theme.dart             ← ThemeData (dark only)
│   │   ├── extensions/
│   │   │   ├── build_context_ext.dart     ← .gold, .surface helpers
│   │   │   ├── datetime_ext.dart          ← .dayName, .isSameDay
│   │   │   └── string_ext.dart            ← .capitalize
│   │   └── utils/
│   │       ├── haptic_util.dart           ← Haptic wrapper
│   │       ├── date_util.dart             ← Date calculations
│   │       └── debounce_util.dart         ← Input debouncing
│   │
│   ├── models/
│   │   ├── user_profile.dart              ← Name, joined date, type
│   │   ├── discipline_block.dart          ← Block enum + metadata
│   │   ├── willpower_type.dart            ← Sprinter/Drifter/Architect
│   │   ├── diagnostic_question.dart       ← Question + answers + mapping
│   │   ├── diagnostic_result.dart         ← Block scores + primary
│   │   ├── program.dart                   ← Program metadata
│   │   ├── program_day.dart               ← Day content
│   │   ├── daily_action.dart              ← Insight + action + reflection
│   │   ├── mood_entry.dart                ← Date + mood value
│   │   ├── streak_data.dart               ← Current + best + history
│   │   ├── book.dart                      ← Book metadata + chapters
│   │   ├── book_chapter.dart              ← Chapter content
│   │   ├── subscription_state.dart        ← Trial/active/expired
│   │   └── achievement.dart               ← Badge definition + unlocked
│   │
│   ├── services/
│   │   ├── storage_service.dart           ← Hive CRUD wrapper
│   │   ├── subscription_service.dart      ← PLACEHOLDER payment
│   │   ├── notification_service.dart      ← Flutter local notifications
│   │   ├── content_service.dart           ← Load JSON content
│   │   └── share_service.dart             ← Share images/text
│   │
│   ├── providers/
│   │   ├── user_provider.dart             ← User state
│   │   ├── onboarding_provider.dart       ← First launch state
│   │   ├── diagnostic_provider.dart       ← Quiz state + scoring
│   │   ├── program_provider.dart          ← Programs + progress
│   │   ├── daily_protocol_provider.dart    ← Today's protocol state
│   │   ├── streak_provider.dart           ← Streak logic
│   │   ├── mood_provider.dart             ← Mood entries
│   │   ├── insight_provider.dart          ← Analytics calculations
│   │   ├── subscription_provider.dart     ← Trial + sub state
│   │   └── settings_provider.dart         ← Sounds, haptics, time
│   │
│   ├── widgets/
│   │   ├── animated/
│   │   │   ├── golden_particles_bg.dart   ← Floating particles
│   │   │   ├── streak_flame.dart          ← Lottie flame widget
│   │   │   ├── golden_button.dart         ← Gradient button + anims
│   │   │   ├── animated_counter.dart      ← Counting number
│   │   │   ├── confetti_overlay.dart      ← Confetti burst
│   │   │   ├── shimmer_sweep.dart         ← Gold shimmer for locked
│   │   │   ├── breathing_circle.dart      ← Animated circle
│   │   │   ├── progress_ring.dart         ← Circular progress
│   │   │   └── glassmorphic_card.dart     ← Frosted glass card
│   │   │
│   │   ├── layout/
│   │   │   ├── app_scaffold.dart          ← Main scaffold wrapper
│   │   │   ├── gold_bottom_nav.dart       ← Custom bottom nav
│   │   │   └── gold_divider.dart          ← Ornamental divider
│   │   │
│   │   ├── cards/
│   │   │   ├── protocol_card.dart         ← Today's protocol card
│   │   │   ├── program_card.dart          ← Program list/grid card
│   │   │   ├── insight_card.dart          ← Quote/insight card
│   │   │   ├── mood_selector.dart         ← Emoji mood picker
│   │   │   ├── stat_card.dart             ← Number + label stat
│   │   │   ├── book_list_tile.dart        ← Book list item
│   │   │   └── setting_tile.dart          ← Settings row
│   │   │
│   │   ├── quiz/
│   │   │   ├── question_card.dart         ← Question display
│   │   │   └── answer_option.dart         ← Tap answer card
│   │   │
│   │   └── common/
│   │       ├── loading_indicator.dart     ← Gold spinning ring
│   │       ├── empty_state.dart           ← Illustrated empty
│   │       ├── trial_banner.dart          ← Trial countdown
│   │       └── error_view.dart            ← Error display
│   │
│   ├── screens/
│   │   ├── splash/
│   │   │   └── splash_screen.dart
│   │   ├── onboarding/
│   │   │   └── onboarding_screen.dart    ← PageView 3 pages
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
│   │   │   ├── program_detail_screen.dart
│   │   │   └── program_day_screen.dart
│   │   ├── library/
│   │   │   ├── library_screen.dart
│   │   │   └── book_reader_screen.dart
│   │   ├── insights/
│   │   │   └── insights_screen.dart
│   │   ├── profile/
│   │   │   └── profile_screen.dart
│   │   ├── subscription/
│   │   │   ├── paywall_screen.dart
│   │   │   ├── trial_ending_screen.dart
│   │   │   └── subscribe_success_screen.dart
│   │   └── settings/
│   │       ├── settings_screen.dart
│   │       └── notification_time_screen.dart
│   │
│   ├── routes/
│   │   └── app_router.dart                ← GoRouter config
│   │
│   └── data/
│       ├── questions.json                 ← 15 diagnostic questions
│       ├── blocks.json                    ← Block definitions
│       ├── programs/
│       │   ├── perfectionism_7day.json
│       │   ├── overwhelm_7day.json
│       │   ├── willpower_7day.json
│       │   ├── fear_of_success_7day.json
│       │   ├── future_self_7day.json
│       │   ├── discipline_30day.json
│       │   ├── focus_30day.json
│       │   ├── habit_30day.json
│       │   ├── mindset_30day.json
│       │   ├── motivation_30day.json
│       │   ├── entrepreneur.json
│       │   ├── student.json
│       │   ├── parent.json
│       │   ├── athlete.json
│       │   ├── creative.json
│       │   └── [15 mastery programs].json
│       └── books/
│           ├── book_01.json
│           ├── book_02.json
│           └── ... book_30.json
│
├── assets/
│   ├── lottie/
│   │   ├── ember.json                   ← Splash logo
│   │   ├── ember_small.json             ← Small flicker
│   │   ├── flame.json                   ← Medium flame
│   │   ├── inferno.json                 ← Large flame
│   │   ├── analyzing.json               ← Loading spinner
│   │   ├── checkmark.json               ← Success check
│   │   ├── bookmark.json                ← Bookmark drop
│   │   └── celebration.json             ← Confetti alt
│   ├── fonts/
│   │   ├── PlayfairDisplay-Bold.ttf
│   │   ├── PlayfairDisplay-SemiBold.ttf
│   │   ├── CormorantGaramond-SemiBold.ttf
│   │   ├── CormorantGaramond-Italic.ttf
│   │   ├── Nunito-Regular.ttf
│   │   ├── Nunito-Medium.ttf
│   │   ├── Nunito-SemiBold.ttf
│   │   └── Nunito-Bold.ttf
│   └── images/
│       └── (none needed — all rendered)
│
├── pubspec.yaml
└── analysis_options.yaml
```

---

## 6. KEY DATA MODELS

```dart
// ===== DISCIPLINE BLOCKS =====
enum DisciplineBlock {
  perfectionismParalysis(
    id: 'perfectionism_paralysis',
    name: 'Perfectionism Paralysis',
    shortName: 'Perfectionism',
    description: "You don't lack motivation — you're protecting yourself from the vulnerability of imperfect work.",
    source: 'Book 1, Chapter 2',
    icon: '🎯',
    color: 0xFFD4A853,
  ),
  overwhelmParalysis(
    id: 'overwhelm_paralysis',
    name: 'Overwhelm Paralysis',
    shortName: 'Overwhelm',
    description: "Your brain can't form a clear starting point. You see the mountain, not the first step.",
    source: 'Book 1, Chapter 2',
    icon: '⛰️',
    color: 0xFFE89B3E,
  ),
  taskAversion(
    id: 'task_aversion',
    name: 'Task Aversion',
    shortName: 'Task Aversion',
    description: "Some tasks feel so unpleasant that avoiding them has become a relief mechanism.",
    source: 'Book 1, Chapter 2',
    icon: '🚫',
    color: 0xFFC44B4B,
  ),
  fearOfFailure(
    id: 'fear_of_failure',
    name: 'Fear of Failure',
    shortName: 'Fear of Failure',
    description: "Procrastination protects you from risking failure. If you never start, you never fail.",
    source: 'Book 1, Chapter 2',
    icon: '😰',
    color: 0xFF5B8EC4,
  ),
  fearOfSuccess(
    id: 'fear_of_success',
    name: 'Fear of Success',
    shortName: 'Fear of Success',
    description: "Success means pressure, exposure, and becoming someone unfamiliar. Your sabotage is self-protection.",
    source: 'Book 4, Chapter 1',
    icon: '🪞',
    color: 0xFF9A7124,
  ),
  futureSelfDisconnect(
    id: 'future_self_disconnect',
    name: 'Future Self Disconnect',
    shortName: 'Future Self Gap',
    description: "Your brain treats your future self like a stranger. Present comfort easily overrides future consequences.",
    source: 'Book 1, Chapter 3',
    icon: '👥',
    color: 0xFF7A591C,
  ),
  willpowerDepletion(
    id: 'willpower_depletion',
    name: 'Willpower Depletion',
    shortName: 'Depleted',
    description: "Your willpower is a finite budget. You're spending it on trivial decisions instead of what matters.",
    source: 'Book 3, Chapter 1',
    icon: '🔋',
    color: 0xFF8B3A1A,
  ),
  comfortZoneTrap(
    id: 'comfort_zone_trap',
    name: 'Comfort Zone Trap',
    shortName: 'Comfort Trap',
    description: "Your comfort zone isn't comfortable — it's familiar. And familiarity is not the same as wellbeing.",
    source: 'Book 5, Chapter 1',
    icon: '🛋️',
    color: 0xFF5B9E5B,
  ),
  attentionFragmentation(
    id: 'attention_fragmentation',
    name: 'Attention Fragmentation',
    shortName: 'Scattered',
    description: "Your attention leaks through a thousand small holes. Quick checks, notifications, open tabs.",
    source: 'Book 6, Chapter 1',
    icon: '📱',
    color: 0xFFC4652A,
  ),
  identityMisalignment(
    id: 'identity_misalignment',
    name: 'Identity Misalignment',
    shortName: 'Wrong Identity',
    description: "You're trying to change behaviors while still believing you're the person who doesn't do those things.",
    source: 'Book 20, Chapter 1',
    icon: '🎭',
    color: 0xFFB8892E,
  );

  const DisciplineBlock({
    required this.id,
    required this.name,
    required this.shortName,
    required this.description,
    required this.source,
    required this.icon,
    required this.color,
  });
}

// ===== WILLPOWER TYPE =====
enum WillpowerType {
  sprinter(
    id: 'sprinter',
    name: 'The Sprinter',
    description: "Bursts of incredible intensity followed by complete collapse. You confuse intensity with discipline.",
    source: 'Book 3, Chapter 3',
  ),
  drifter(
    id: 'drifter',
    name: 'The Drifter',
    description: "Average willpower applied randomly. You resist some temptations and give in to others with no pattern.",
    source: 'Book 3, Chapter 3',
  ),
  architect(
    id: 'architect',
    name: 'The Architect',
    description: "Strategic and systematic. You design environments that require less willpower, not more.",
    source: 'Book 3, Chapter 3',
  );

  const WillpowerType({
    required this.id,
    required this.name,
    required this.description,
    required this.source,
  });
}

// ===== DIAGNOSTIC RESULT =====
@HiveType(typeId: 0)
class DiagnosticResult extends HiveObject {
  @HiveField(0) final DateTime date;
  @HiveField(1) final DisciplineBlock primaryBlock;
  @HiveField(2) final DisciplineBlock? secondaryBlock;
  @HiveField(3) final WillpowerType willpowerType;
  @HiveField(4) final Map<String, int> blockScores; // blockId → score

  DiagnosticResult({
    required this.date,
    required this.primaryBlock,
    this.secondaryBlock,
    required this.willpowerType,
    required this.blockScores,
  });
}

// ===== SUBSCRIPTION STATE =====
@HiveType(typeId: 1)
class SubscriptionState extends HiveObject {
  @HiveField(0) bool isSubscribed;
  @HiveField(1) DateTime? trialStartDate;
  @HiveField(2) DateTime? subscriptionDate;
  @HiveField(3) String plan; // 'monthly', 'yearly', 'placeholder'

  int get trialDaysRemaining {
    if (trialStartDate == null) return 0;
    final end = trialStartDate!.add(Duration(days: 7));
    return max(0, end.difference(DateTime.now()).inDays);
  }

  bool get isTrialActive => trialDaysRemaining > 0 && !isSubscribed;
  bool get isExpired => !isSubscribed && trialDaysRemaining == 0;
  bool get hasAccess => isSubscribed || isTrialActive;

  SubscriptionState({
    this.isSubscribed = false,
    this.trialStartDate,
    this.subscriptionDate,
    this.plan = 'placeholder',
  });
}

// ===== PROGRAM =====
@HiveType(typeId: 2)
class ProgramProgress extends HiveObject {
  @HiveField(0) final String programId;
  @HiveField(1) int currentDay;
  @HiveField(2) final Set<int> completedDays;
  @HiveField(3) DateTime? lastAccessed;
  @HiveField(4) bool isCompleted;

  double get progress => completedDays.length / totalDays;
  bool get hasAccess => currentDay <= unlockedDays;

  int get unlockedDays {
    if (isCompleted) return totalDays;
    if (completedDays.isEmpty) return 1;
    return completedDays.reduce(max) + 1;
  }
}

// ===== MOOD ENTRY =====
@HiveType(typeId: 3)
class MoodEntry {
  @HiveField(0) final DateTime date;
  @HiveField(1) final int mood; // 1=hard, 2=meh, 3=weird, 4=free
  @HiveField(2) final String? note;
}
```

---

## 7. SUBSCRIPTION FLOW LOGIC

```dart
class SubscriptionService {
  final StorageService _storage;

  // CHECK ON EVERY APP OPEN
  Future<void> checkSubscription() async {
    final state = await _storage.getSubscriptionState();

    if (state == null) {
      // FIRST LAUNCH → Start trial
      await _storage.saveSubscriptionState(
        SubscriptionState(trialStartDate: DateTime.now()),
      );
      return;
    }

    if (state.isExpired) {
      // TRIAL EXPIRED → Show hard paywall
      // Cannot navigate away until subscribed
      return;
    }

    if (state.isTrialActive && state.trialDaysRemaining <= 3) {
      // TRIAL ENDING SOON → Show reminder banner
      return;
    }
  }

  // PLACEHOLDER SUBSCRIBE
  Future<bool> subscribe({required String plan}) async {
    // >>> THIS IS THE PLACEHOLDER <<<
    // In production: integrate real payment
    // For now: just store locally

    await Future.delayed(Duration(seconds: 2)); // Fake loading

    final state = await _storage.getSubscriptionState();
    state!.isSubscribed = true;
    state.subscriptionDate = DateTime.now();
    state.plan = plan;
    await _storage.saveSubscriptionState(state);

    return true;
  }

  // RESTORE (placeholder)
  Future<bool> restorePurchase() async {
    final state = await _storage.getSubscriptionState();
    if (state?.isSubscribed == true) return true;
    return false;
  }
}
```

### Navigation Guards

```dart
// In GoRouter redirect logic:
redirect: (context, state) async {
  final subProvider = context.read<SubscriptionProvider>();
  await subProvider.initialize();

  final currentPath = state.matchedLocation;

  // These screens are always accessible
  final publicPaths = ['/splash', '/onboarding', '/diagnostic', '/paywall'];

  if (publicPaths.contains(currentPath)) return null;

  // Not logged in at all → onboarding
  if (!subProvider.hasStartedTrial) return '/onboarding';

  // Subscription expired → hard paywall (cannot leave)
  if (subProvider.isExpired) return '/paywall';

  return null; // Allow navigation
}
```

### Trial Banner Logic

```dart
Widget buildTrialBanner(BuildContext context) {
  final sub = context.watch<SubscriptionProvider>();

  if (sub.isSubscribed) return SizedBox.shrink();
  if (sub.isExpired) return SizedBox.shrink();
  if (sub.trialDaysRemaining > 4) return SizedBox.shrink();

  final days = sub.trialDaysRemaining;
  final isUrgent = days <= 1;

  return AnimatedSlide(
    offset: Offset(0, isUrgent ? 0 : -1),
    duration: Duration(milliseconds: 400),
    child: GlassmorphicCard(
      color: isUrgent ? Color(0x33C44B4B) : Color(0x33E89B3E),
      child: Row(
        children: [
          Icon(isUrgent ? Icons.warning : Icons.timer, color: AppColors.gold300),
          Text(isUrgent
            ? "Last day! Subscribe to keep your progress"
            : "$days days left in your trial"),
          TextButton(onPressed: () => navigateToPaywall(), child: Text("View Plans")),
        ],
      ),
    ),
  );
}
```

---

## 8. THE 15 DIAGNOSTIC QUESTIONS

```json
{
  "questions": [
    {
      "id": "q1",
      "text": "When you procrastinate, what's usually happening inside?",
      "answers": [
        {"id": "a", "text": "The task feels genuinely unpleasant to do", "mapsTo": ["taskAversion"]},
        {"id": "b", "text": "I can't figure out where to start — it all feels like too much", "mapsTo": ["overwhelmParalysis"]},
        {"id": "c", "text": "I'm worried the result won't be good enough", "mapsTo": ["perfectionismParalysis"]},
        {"id": "d", "text": "I'm scared of what happens if I try and fail", "mapsTo": ["fearOfFailure"]}
      ]
    },
    {
      "id": "q2",
      "text": "You set a big goal. What happens next?",
      "answers": [
        {"id": "a", "text": "I attack it with extreme intensity for about 2 weeks, then completely stop", "mapsTo": ["willpowerDepletion"], "willpowerType": "sprinter"},
        {"id": "b", "text": "I work on it when I feel motivated, which is unpredictable", "mapsTo": ["identityMisalignment"], "willpowerType": "drifter"},
        {"id": "c", "text": "I break it into small systems before I start, then follow the system", "mapsTo": [], "willpowerType": "architect"},
        {"id": "d", "text": "I plan extensively but struggle to start the actual work", "mapsTo": ["perfectionismParalysis"]}
      ]
    },
    {
      "id": "q3",
      "text": "When you get close to achieving something, you tend to...",
      "answers": [
        {"id": "a", "text": "Feel anxious about the expectations that come with success", "mapsTo": ["fearOfSuccess"]},
        {"id": "b", "text": "Lose interest and start something new", "mapsTo": ["fearOfSuccess", "identityMisalignment"]},
        {"id": "c", "text": "Find yourself making careless mistakes out of nowhere", "mapsTo": ["fearOfSuccess"]},
        {"id": "d", "text": "Push through to the finish with relief", "mapsTo": []}
      ]
    },
    {
      "id": "q4",
      "text": "How do you feel about your future self?",
      "answers": [
        {"id": "a", "text": "Like a stranger — I can't really picture who they'll be", "mapsTo": ["futureSelfDisconnect"]},
        {"id": "b", "text": "Like a burden — they'll have to deal with my current choices", "mapsTo": ["futureSelfDisconnect"]},
        {"id": "c", "text": "Like a project — I'm actively building them", "mapsTo": []},
        {"id": "d", "text": "Like a fantasy — I imagine them but don't connect it to today", "mapsTo": ["futureSelfDisconnect"]}
      ]
    },
    {
      "id": "q5",
      "text": "By 6 PM, you can't seem to make yourself do anything. Why?",
      "answers": [
        {"id": "a", "text": "I've been making decisions all day — I'm mentally drained", "mapsTo": ["willpowerDepletion"]},
        {"id": "b", "text": "I've been resisting temptations all day — I'm out of self-control", "mapsTo": ["willpowerDepletion"]},
        {"id": "c", "text": "I didn't sleep well or eat properly — my body is running on empty", "mapsTo": ["willpowerDepletion"]},
        {"id": "d", "text": "I don't have this problem — I maintain energy all day", "mapsTo": []}
      ]
    },
    {
      "id": "q6",
      "text": "What does 'success' secretly feel like to you?",
      "answers": [
        {"id": "a", "text": "Pressure — more expectations, more to maintain", "mapsTo": ["fearOfSuccess"]},
        {"id": "b", "text": "Exposure — people will see me and judge me", "mapsTo": ["fearOfSuccess", "perfectionismParalysis"]},
        {"id": "c", "text": "Loss — I'll outgrow my current relationships", "mapsTo": ["fearOfSuccess", "comfortZoneTrap"]},
        {"id": "d", "text": "Freedom — I'll have more options and control", "mapsTo": []}
      ]
    },
    {
      "id": "q7",
      "text": "How often do you check your phone during focused work?",
      "answers": [
        {"id": "a", "text": "Constantly — almost without thinking, like a reflex", "mapsTo": ["attentionFragmentation"]},
        {"id": "b", "text": "Every 20-30 minutes — I tell myself it's just a quick check", "mapsTo": ["attentionFragmentation"]},
        {"id": "c", "text": "Rarely — I put my phone away when I need to focus", "mapsTo": []},
        {"id": "d", "text": "I don't really do focused work — I'm always multitasking", "mapsTo": ["attentionFragmentation", "willpowerDepletion"]}
      ]
    },
    {
      "id": "q8",
      "text": "When someone suggests you try something new, your first reaction is...",
      "answers": [
        {"id": "a", "text": "Interest — I love trying new things", "mapsTo": []},
        {"id": "b", "text": "Hesitation — what if I'm bad at it?", "mapsTo": ["perfectionismParalysis", "fearOfFailure"]},
        {"id": "c", "text": "Resistance — I'm fine with how things are", "mapsTo": ["comfortZoneTrap"]},
        {"id": "d", "text": "Excitement — but I rarely follow through", "mapsTo": ["identityMisalignment"]}
      ]
    },
    {
      "id": "q9",
      "text": "Which statement feels most true about you?",
      "answers": [
        {"id": "a", "text": "I know exactly what I should do, I just can't make myself do it", "mapsTo": ["willpowerDepletion"]},
        {"id": "b", "text": "I'm not sure what I should do — everything feels equally important", "mapsTo": ["overwhelmParalysis"]},
        {"id": "c", "text": "I start things with enthusiasm but lose steam quickly", "mapsTo": ["identityMisalignment", "willpowerDepletion"]},
        {"id": "d", "text": "I avoid starting because I know I won't finish", "mapsTo": ["fearOfFailure"]}
      ]
    },
    {
      "id": "q10",
      "text": "You just got a compliment on your work. What do you feel?",
      "answers": [
        {"id": "a", "text": "Proud — I worked hard on this", "mapsTo": []},
        {"id": "b", "text": "Anxious — now they expect this every time", "mapsTo": ["perfectionismParalysis", "fearOfSuccess"]},
        {"id": "c", "text": "Suspicious — they're just being nice, it's not that good", "mapsTo": ["fearOfSuccess"]},
        {"id": "d", "text": "Empty — the compliment doesn't feel real to me", "mapsTo": ["identityMisalignment"]}
      ]
    },
    {
      "id": "q11",
      "text": "Your life right now could be described as...",
      "answers": [
        {"id": "a", "text": "Comfortable but stagnant — nothing changes", "mapsTo": ["comfortZoneTrap"]},
        {"id": "b", "text": "Chaotic but moving — lots of starts and stops", "mapsTo": ["willpowerDepletion"]},
        {"id": "c", "text": "Structured and growing — I have systems in place", "mapsTo": []},
        {"id": "d", "text": "Frustrating — I know I'm capable of more", "mapsTo": ["identityMisalignment"]}
      ]
    },
    {
      "id": "q12",
      "text": "What would you do if you knew you couldn't fail?",
      "answers": [
        {"id": "a", "text": "Exactly what I'm doing now, but with more confidence", "mapsTo": ["fearOfFailure"]},
        {"id": "b", "text": "Something completely different from my current path", "mapsTo": ["fearOfFailure", "comfortZoneTrap"]},
        {"id": "c", "text": "The same things — failure isn't what holds me back", "mapsTo": []},
        {"id": "d", "text": "I genuinely don't know — I've never let myself imagine it", "mapsTo": ["fearOfFailure", "fearOfSuccess"]}
      ]
    },
    {
      "id": "q13",
      "text": "How do you handle a task you've been avoiding?",
      "answers": [
        {"id": "a", "text": "I make it as small as possible — just open the document", "mapsTo": ["overwhelmParalysis"]},
        {"id": "b", "text": "I pair it with something enjoyable — coffee shop + hard task", "mapsTo": ["taskAversion"]},
        {"id": "c", "text": "I tell myself it doesn't have to be good — just done", "mapsTo": ["perfectionismParalysis"]},
        {"id": "d", "text": "I usually keep avoiding it until a deadline forces me", "mapsTo": ["willpowerDepletion", "futureSelfDisconnect"]}
      ]
    },
    {
      "id": "q14",
      "text": "When you try to build a new habit, what usually goes wrong?",
      "answers": [
        {"id": "a", "text": "I start too big and burn out after a week", "mapsTo": ["willpowerDepletion"]},
        {"id": "b", "text": "I miss one day and feel like it's ruined — then I quit", "mapsTo": ["perfectionismParalysis"]},
        {"id": "c", "text": "I do it for a while but it never feels natural — like I'm forcing it", "mapsTo": ["identityMisalignment"]},
        {"id": "d", "text": "Life gets busy and I just... stop. No particular reason.", "mapsTo": ["comfortZoneTrap"]}
      ]
    },
    {
      "id": "q15",
      "text": "Deep down, what do you believe about yourself?",
      "answers": [
        {"id": "a", "text": "I'm capable but undisciplined — if I could just get my act together", "mapsTo": ["willpowerDepletion", "identityMisalignment"]},
        {"id": "b", "text": "I'm talented but broken — something inside me blocks my potential", "mapsTo": ["fearOfSuccess", "fearOfFailure"]},
        {"id": "c", "text": "I'm comfortable but stuck — I've settled for less than I want", "mapsTo": ["comfortZoneTrap"]},
        {"id": "d", "text": "I'm becoming someone — I'm in process and that's okay", "mapsTo": []}
      ]
    }
  ]
}
```

### Scoring Algorithm

```dart
Map<String, int> calculateBlockScores(List<Answer> answers) {
  final scores = <String, int>{};

  for (final answer in answers) {
    for (final blockId in answer.mapsTo) {
      scores[blockId] = (scores[blockId] ?? 0) + 1;
    }
  }

  return scores;
}

WillpowerType determineWillpowerType(List<Answer> answers) {
  final typeCounts = <String, int>{'sprinter': 0, 'drifter': 0, 'architect': 0};

  for (final answer in answers) {
    if (answer.willpowerType != null) {
      typeCounts[answer.willpowerType!] =
        (typeCounts[answer.willpowerType!] ?? 0) + 1;
    }
  }

  // Default to drifter if no clear signal
  if (typeCounts.values.every((c) => c == 0)) return WillpowerType.drifter;

  final maxEntry = typeCounts.entries.reduce(
    (a, b) => a.value >= b.value ? a : b
  );

  return WillpowerType.values.firstWhere(
    (t) => t.id == maxEntry.key,
    orElse: () => WillpowerType.drifter,
  );
}
```

---

## 9. FLUTTER PACKAGES

```yaml
name: ember
description: The Discipline Diagnostic
version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

  # ── State ──
  provider: ^6.1.0
  go_router: ^13.0.0

  # ── Storage ──
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  # ── Animations ──
  flutter_animate: ^4.4.0          # Declarative animations
  lottie: ^3.0.0                   # Pre-built animations
  confetti: ^0.7.0                 # Celebration effect

  # ── UI ──
  google_fonts: ^6.1.0             # Typography
  flutter_svg: ^2.0.9              # SVG assets
  shimmer: ^3.0.0                  # Loading shimmer

  # ── Charts ──
  fl_chart: ^0.68.0                # Mood + score charts

  # ── Notifications ──
  flutter_local_notifications: ^17.0.0

  # ── Utils ──
  intl: ^0.19.0                    # Date formatting
  uuid: ^4.3.0                     # Unique IDs
  haptic_feedback: ^0.4.0          # Haptic control
  share_plus: ^7.2.0               # Native sharing
  path_provider: ^2.1.0            # File paths

dev_dependencies:
  flutter_test:
    sdk: flutter
  hive_generator: ^2.0.1
  build_runner: ^2.4.7
  flutter_lints: ^3.0.1
```

---

## 10. BUILD ROADMAP

### Phase 1: Foundation (Days 1-3)
```
□ Project setup + all packages
□ AppTheme (dark, gold palette)
□ AppColors, AppTypography, AppSpacing constants
□ GoldenParticlesBackground widget
□ GlassmorphicCard widget
□ GoldenButton widget
□ GoRouter setup with all routes (stub screens)
□ Hive initialization + StorageService
□ SubscriptionService (PLACEHOLDER)
□ SubscriptionProvider + trial logic
□ Navigation guards (paywall redirect)
```

### Phase 2: Diagnostic (Days 4-6)
```
□ questions.json with all 15 questions
□ blocks.json with all block definitions
□ DiagnosticProvider (quiz state + scoring)
□ Splash screen (particles + logo + auto-navigate)
□ Onboarding screen (3-page PageView)
□ Diagnostic quiz screen (card swipe)
□ Analyzing screen (loading animation)
□ Diagnostic result screen (dramatic reveal)
```

### Phase 3: Core Experience (Days 7-10)
```
□ First 5 programs as JSON:
  - perfectionism_7day.json
  - overwhelm_7day.json
  - willpower_7day.json
  - fear_of_success_7day.json
  - future_self_7day.json
□ ContentService (load JSON programs)
□ ProgramProvider (progress tracking)
□ DailyProtocolProvider (today's content)
□ Home screen (streak + protocol card + programs)
□ Daily protocol screen (insight + action + mood)
□ Protocol complete screen (confetti + reflection)
□ StreakProvider (streak logic + recovery)
□ StreakFlame widget (Lottie)
□ MoodSelector widget
□ ProgressRing widget
□ MoodProvider
□ TrialBanner widget
```

### Phase 4: Library & Programs (Days 11-13)
```
□ Programs screen (categories + grid + locked shimmer)
□ Program detail screen (week breakdown + progress)
□ Book library screen (list + recommended badges)
□ Book reader screen (scroll + highlight + bookmark)
□ First 5 books as JSON (matching first 5 programs)
□ Paywall screen (full design + placeholder subscribe)
□ Subscribe success screen
□ Program lock → paywall navigation
```

### Phase 5: Insights & Profile (Days 14-15)
```
□ InsightProvider (score calculation + mood aggregation)
□ Insights screen (stats + mood chart + score trend + badges)
□ AnimatedCounter widget
□ fl_chart mood line chart (gold themed)
□ fl_chart score bar chart (gold gradient)
□ Profile screen (DNA + stats + settings links)
□ Settings screen (notification time + sounds + haptics)
□ NotificationTimeScreen (time picker)
□ NotificationService (daily reminder)
□ Achievement system (badge definitions + unlock logic)
```

### Phase 6: Polish & Launch (Days 16-18)
```
□ All micro-interactions (button press, card lift, haptics)
□ All page transitions (gold fade, quiz slide, reveal)
□ ShimmerSweep for locked cards
□ BreathingCircle widget (optional: add to a program day)
□ ShareService (generate share image for wins)
□ Empty states for all lists
□ Error handling + error views
□ App icon (gold on black)
□ Store screenshots (5 screens, golden aesthetic)
□ Google Play Console listing
□ Internal testing track
□ Production release
```

---

## 11. APP ICON CONCEPT

```
┌─────────────────────┐
│                     │
│      (rounded       │
│       square)       │
│                     │
│    ╭─────────╮      │
│    │  🔥     │      │  ← Minimal flame icon
│    │  EMBER  │      │     Gold on #110F0D bg
│    ╰─────────╯      │     No text in icon
│                     │     Just the golden flame
│                     │     Subtle gold glow
│                     │     around it
└─────────────────────┘

Icon should be recognizable at 48px.
Golden flame on deep warm black.
Optional: very subtle golden radial gradient behind flame.
```

---

## 12. WHAT MAKES THIS NOT BORING

Every "boring" moment has a golden upgrade:

| Boring Thing | What Ember Does Instead |
|---|---|
| Loading spinner | Golden spinning ring with cycling text |
| Checkbox | Gold fill animation + haptic |
| List of programs | Categorized grid with hover shimmer on locked items |
| Progress bar | Animated gold gradient bar with glow |
| Empty state | Illustrated ember with warm text |
| Page transition | Gold fade with scale + particles |
| Task complete | Confetti burst + golden screen flash |
| Streak counter | Animated flame that grows with streak |
| Paywall | Full cinematic experience with particles |
| Error message | Warm red glow card, not harsh alert |
| Pull to refresh | Golden sparkle trail |
| Number display | Counting animation from 0 |
| Diagnostic result | Dramatic scale-in reveal with particles |
| Locked content | Gold shimmer sweep (not ugly gray overlay) |
| Mood selection | Circular buttons with gold ring on select |
| Book reading | Paragraph highlight with smooth gold animation |
| Bottom nav | Gold dot that slides between tabs |
| Notification time | Custom time picker with gold accent |
| Trial ending | Urgent warm-red banner that animates in |
| Onboarding | Letter-by-letter text reveal |

---

This is your complete blueprint. Every screen, every color, every animation, every data model, every file. An AI or developer can build the entire app from this document alone.
