# Color Palette Templates

A polished collection of UI color palettes for SaaS dashboards, task managers, productivity tools, and modern web or mobile applications.

These palettes are designed for clean interfaces with readable text, calm surfaces, clear actions, and consistent status colors.

## Contents

- [Quick Recommendation](#quick-recommendation)
- [Palette Overview](#palette-overview)
- [How To Use These Palettes](#how-to-use-these-palettes)
- [1. Calm Blue](#1-calm-blue)
- [2. Fresh Teal](#2-fresh-teal)
- [3. Indigo Sky](#3-indigo-sky)
- [4. Productivity Green](#4-productivity-green)
- [5. Soft Purple](#5-soft-purple)
- [Implementation Tokens](#implementation-tokens)
- [Design Notes](#design-notes)

## Quick Recommendation

For a professional task management or dashboard product, start with **Calm Blue**.

It gives the interface a modern SaaS look, keeps content easy to scan, and works well for sidebars, cards, buttons, task states, analytics, and admin screens.

## Palette Overview

| Palette | Best For | Mood | Primary |
| --- | --- | --- | --- |
| **Calm Blue** | Dashboards, task managers, admin tools | Professional, reliable, modern | `#2563EB` |
| **Fresh Teal** | Productivity apps, lightweight tools | Clean, friendly, calm | `#0D9488` |
| **Indigo Sky** | Premium SaaS, analytics, team products | Polished, confident, scalable | `#4F46E5` |
| **Productivity Green** | Progress-focused apps, habit trackers | Fresh, active, completion-oriented | `#16A34A` |
| **Soft Purple** | Creative tools, modern workspaces | Creative, refined, contemporary | `#7C3AED` |

## How To Use These Palettes

Use each palette as a full UI system rather than selecting random colors individually.

| UI Area | Recommended Usage |
| --- | --- |
| Primary color | Main buttons, active states, links, selected navigation |
| Primary hover | Hover and pressed states for primary actions |
| Background | Main app canvas or page background |
| Cards | Task cards, panels, forms, tables, and modal surfaces |
| Sidebar | Navigation background or secondary layout area |
| Main text | Headings and primary body text |
| Secondary text | Metadata, descriptions, helper labels |
| Border | Dividers, inputs, table borders, card outlines |
| Accent | Highlights, charts, empty states, small visual details |

## 1. Calm Blue

**Recommended palette for dashboards and professional task management apps.**

Calm Blue feels trustworthy, modern, and flexible. It is a strong default choice for SaaS products because the main blue action color pairs well with neutral backgrounds and high-contrast text.

| UI Element | Color Name | Hex |
| --- | --- | --- |
| Primary | Royal Blue | `#2563EB` |
| Primary hover | Deep Blue | `#1D4ED8` |
| App background | Soft Gray | `#F8FAFC` |
| Cards | White | `#FFFFFF` |
| Sidebar | Pale Blue | `#EFF6FF` |
| Main text | Dark Navy | `#0F172A` |
| Secondary text | Slate Gray | `#64748B` |
| Borders | Light Gray | `#E2E8F0` |
| Success | Green | `#16A34A` |
| Warning | Amber | `#F59E0B` |
| Error | Red | `#DC2626` |
| Selected menu item | Light Blue | `#DBEAFE` |

### Example Usage

| Component | Hex |
| --- | --- |
| Sidebar background | `#EFF6FF` |
| Dashboard background | `#F8FAFC` |
| Task cards | `#FFFFFF` |
| Create task button | `#2563EB` |
| Selected menu item | `#DBEAFE` |
| Completed task status | `#16A34A` |

## 2. Fresh Teal

A clean and friendly palette for productivity applications.

Fresh Teal works especially well when the product should feel simple, focused, and approachable without looking casual.

| UI Element | Hex |
| --- | --- |
| Primary | `#0D9488` |
| Primary hover | `#0F766E` |
| Background | `#F8FAFA` |
| Cards | `#FFFFFF` |
| Sidebar | `#F0FDFA` |
| Main text | `#134E4A` |
| Secondary text | `#64748B` |
| Border | `#CCFBF1` |
| Accent | `#14B8A6` |

### Best Fit

Use Fresh Teal for calm task trackers, note-taking tools, personal productivity apps, and lightweight client dashboards.

## 3. Indigo Sky

A slightly more premium SaaS appearance.

Indigo Sky gives the interface a confident and polished look. It suits products that include team management, analytics, reports, subscription plans, or workspace collaboration.

| UI Element | Hex |
| --- | --- |
| Primary | `#4F46E5` |
| Primary hover | `#4338CA` |
| Background | `#F8FAFC` |
| Cards | `#FFFFFF` |
| Sidebar | `#EEF2FF` |
| Main text | `#1E1B4B` |
| Secondary text | `#64748B` |
| Border | `#E0E7FF` |
| Accent | `#0EA5E9` |

### Best Fit

Use Indigo Sky for subscription dashboards, reporting tools, project management apps, and SaaS admin portals.

## 4. Productivity Green

A fresh theme that emphasizes task completion and progress.

Productivity Green is ideal when progress, completion, and positive momentum are core parts of the experience.

| UI Element | Hex |
| --- | --- |
| Primary | `#16A34A` |
| Primary hover | `#15803D` |
| Background | `#F8FAFC` |
| Cards | `#FFFFFF` |
| Sidebar | `#F0FDF4` |
| Main text | `#14532D` |
| Secondary text | `#64748B` |
| Border | `#DCFCE7` |
| Accent | `#22C55E` |

### Usage Note

Avoid using green for every interface element. Green should remain strongly associated with completed tasks, success states, and progress indicators.

## 5. Soft Purple

A creative and modern palette without becoming too colorful.

Soft Purple brings a more expressive feeling to the interface while still keeping the layout clean and professional.

| UI Element | Hex |
| --- | --- |
| Primary | `#7C3AED` |
| Primary hover | `#6D28D9` |
| Background | `#FAFAFF` |
| Cards | `#FFFFFF` |
| Sidebar | `#F5F3FF` |
| Main text | `#2E1065` |
| Secondary text | `#6B7280` |
| Border | `#EDE9FE` |
| Accent | `#A78BFA` |

### Best Fit

Use Soft Purple for creative productivity tools, AI workspaces, planning apps, and products that need a slightly more distinctive brand presence.

## Implementation Tokens

Use this naming structure when adding the palette to CSS, Flutter theme files, design tokens, or component libraries.

```css
:root {
  --color-primary: #2563EB;
  --color-primary-hover: #1D4ED8;
  --color-background: #F8FAFC;
  --color-surface: #FFFFFF;
  --color-sidebar: #EFF6FF;
  --color-text-primary: #0F172A;
  --color-text-secondary: #64748B;
  --color-border: #E2E8F0;
  --color-success: #16A34A;
  --color-warning: #F59E0B;
  --color-error: #DC2626;
}
```

```dart
class AppColors {
  static const primary = Color(0xFF2563EB);
  static const primaryHover = Color(0xFF1D4ED8);
  static const background = Color(0xFFF8FAFC);
  static const surface = Color(0xFFFFFFFF);
  static const sidebar = Color(0xFFEFF6FF);
  static const textPrimary = Color(0xFF0F172A);
  static const textSecondary = Color(0xFF64748B);
  static const border = Color(0xFFE2E8F0);
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFDC2626);
}
```

## Design Notes

- Keep backgrounds light and neutral so cards and content remain easy to read.
- Use the primary color for important actions only, especially create, save, update, and selected navigation states.
- Use secondary text for supporting information, timestamps, captions, and muted labels.
- Use borders lightly to separate content without making the interface feel heavy.
- Reserve success, warning, and error colors for status feedback.
- Test text contrast before shipping, especially when using colored text on tinted backgrounds.

