# AGENTS.md — PC Health Check Kit (formerly Mum PC Helper)
# Last updated: 2026-10-15 | Remote: https://github.com/ComicCoder23/pc-health-check-kit

---

## Project

**Name:** PC Health Check Kit (renamed from Mum PC Helper, Alan, 15 Oct 2026)
**Purpose:** Guided Windows PC support kit for non-technical users. A structured field kit for safely maintaining and cleaning up a home PC. Designed for confident helpers visiting family/friends — covers what to ask, what to clean, which scripts to run, how to read results, and how to log the visit.
**Canonical path (Old Boot):** `/home/alan82/builds/mums-pc-helper`
**GitHub remote:** `ComicCoder23/pc-health-check-kit` (renamed from `mums-pc-helper` on 15 Oct 2026)
**Build %:** 90%

---

## Run Commands

No run commands for agents. PowerShell scripts in this repo are AUDIT-ONLY and are for end-user deployment, not agent execution.

SAFETY RULE: Agents must NEVER run the PowerShell scripts in bulk or autonomously. Read-only inspection only. Scripts must only be run by Alan or a designated helper, directly on the target user's machine. See `scripts/Safety-Notes.txt` for the full safety boundary.

If Alan explicitly asks an agent to inspect a script, read it — do not execute it.

Layout check (safe to run):

```bash
node tools/verify-packaging.mjs
```

---

## Key Files

| File | Purpose |
|---|---|
| `README.md` | Root overview — layout, quick-start, design principles |
| `product/` | Customer-facing guide sources |
| `build/Mum PC Helper - Master Index.md` | Full-kit front door for helpers |
| `build/Mum PC Helper - Run Order for Scripts.md` | Locked script visit order |
| `release/Mum PC Helper v1/01 Start Here/Mum PC Helper - Start Here.md` | Pack entry point |
| `release/Mum PC Helper v1/02 Quick Guides/Mum PC Helper - Quick Run Card.md` | One-page condensed reference |
| `release/Mum PC Helper v1/02 Quick Guides/Mum PC Helper - Visit Workflow One Pager.md` | Visit workflow |
| `release/Mum PC Helper v1/02 Quick Guides/Mum PC Helper - Action Decision Tree.md` | Decision tree for unclear problems |
| `release/Mum PC Helper v1/03 User Guide/Mum PC Helper - User Guide.md` | Fuller user instructions |
| `release/Mum PC Helper v1/04 Scripts/` | 5 PowerShell audit scripts (READ-ONLY tools) |
| `release/Mum PC Helper v1/05 Script Notes/Safety-Notes.txt` | Script safety boundary |
| `release/Mum-PC-Helper-v1.zip` | Packaged v1 product bundle |
| `scripts/Safety-Notes.txt` | Safety notes in root scripts folder |
| `archive/` | Superseded / empty docs (not live guidance) |
| `docs/index.html` | GitHub Pages hire landing |

---

## Agent Rules

- SAFETY RULE: PowerShell scripts in this pack are designed for deployment on non-technical users' Windows machines. Agents must NEVER execute them in bulk without Alan's explicit approval. Always read-only inspect first.
- Scripts are audit-only: they read folder sizes, read registry values, and write one plain text report to the Desktop. They do not delete, move, or modify anything. If a script asks for unexpected admin access, stop and alert Alan.
- Never push directly to `main`/`master` without approval. Branch + PR by default.
- GitHub (`ComicCoder23/pc-health-check-kit`) is the source of truth — run `git pull` before any write.
- Keep the downloadable pack under `release/Mum PC Helper v1/` and `release/Mum-PC-Helper-v1.zip`. Do not revive `PC Helper v1` / `PC-Helper-v1` package names.
- ~~Canonical public product name is **Mum PC Helper** (locked for v1).~~ **Public name is now PC Health Check Kit** (Alan, 15 Oct 2026, CV link work order). The pack's file names keep the old name for now, so `tools/verify-packaging.mjs` still passes.
- Public wording rules (Alan, 15 Oct): plain UK English, no "field kit", "Tier A", "v1.0 field kit" or "real support kit, not a demo app". Never claim the kit has been run on another PC (it hasn't), a paid IT job or ticket work.
- Alan's real name must never appear in commits, release files, or public content.
- Locked script order: DiskSpace → Downloads → optional LargeFiles / Programs / Startup.

---

## Current State

**Build %:** 90%
**Status:** Docs classified into `product/` / `build/` / `archive/`. Release pack and zip use Mum PC Helper naming. Pages landing live. Visit path locked.

**Parked (non-goals for packaging pass):**
- Browser helper script, printable PDF, one-click launcher (optional v1.1)
