# PC Health Check Kit

I fixed my mum's slow PC by hand, then wrote PowerShell checks that inspect and report without changing existing files. The checks write plain-text reports to the Desktop. Not yet run on another PC.

It's a short checklist plus five PowerShell scripts that only look and report. Nothing gets deleted until you've seen the evidence, and the notes are there for whoever comes next.

**Author:** [ComicCoder23](https://github.com/ComicCoder23) · **Live page:** [comiccoder23.github.io/pc-health-check-kit](https://comiccoder23.github.io/pc-health-check-kit/)

---

## What it covers

| What | Where |
|---|---|
| Check first, clean second | The scripts read and report only. Cleaning comes after |
| Careful changes | Never touch system folders. Obvious junk only. If unsure, leave it |
| A set order for each visit | Master Index → Quick Run Card → ask → check → clean → notes |
| Notes | Product, build and archive guides, a one-page run card and a decision tree |
| PowerShell | Five read-only scripts with a fixed run order |

The scripts are in [`scripts/`](scripts/) and the whole pack is in [`release/Mum-PC-Helper-v1.zip`](release/Mum-PC-Helper-v1.zip). The files inside still use the kit's old name, Mum PC Helper.

---

## Design principles

- Audit first, clean second
- Obvious junk only — if unsure, leave it
- Never touch system folders
- One visit at a time — do not try to fix everything in one session
- Built-in Windows tools first; scripts only when they help

---

## Quick start (every visit)

1. Open **Master Index** or **Start Here**
2. Open **Quick Run Card** and **Safety Notes**
3. Ask the opening questions (`What To Ask Mum`)
4. Run **DiskSpaceAudit.ps1**
5. Run **DownloadsAudit.ps1**
6. Clean obvious junk from Downloads
7. Tidy obvious Desktop clutter
8. Empty Recycle Bin
9. Recheck free space
10. Update **Session Notes**
11. Only if still needed: **LargeFilesFinder** → **InstalledProgramsExport** → **StartupItemsReview**

Entry points:

- `product/Mum PC Helper Pack — Start Here.md`
- `build/Mum PC Helper - Master Index.md`
- `product/Mum PC Helper - Quick Run Card.md`
- Live page: [comiccoder23.github.io/pc-health-check-kit](https://comiccoder23.github.io/pc-health-check-kit/)

---

## PowerShell scripts (audit-only)

Live copies: [`scripts/`](scripts/) · Packaged copies: inside [`release/Mum-PC-Helper-v1.zip`](release/Mum-PC-Helper-v1.zip)

| Order | Script | When |
|---|---|---|
| 1 | `DiskSpaceAudit.ps1` | Always first — drive space + user folder sizes |
| 2 | `DownloadsAudit.ps1` | Usual second — large/old downloads and installer clutter |
| 3 | `LargeFilesFinder.ps1` | Only if space is still tight or unexplained |
| 4 | `InstalledProgramsExport.ps1` | Only if apps review is needed |
| 5 | `StartupItemsReview.ps1` | Only if startup is still slow |

**Safety:** scripts do not delete, move, or modify user files. They read sizes/lists (and read registry values where needed) and write one plain-text report to the Desktop. See `scripts/Safety-Notes.txt`.

Run as the logged-in user. Do not approve unexpected admin prompts.

---

## Repo layout

| Folder | Role |
|---|---|
| `product/` | Customer-facing guide sources that feed the downloadable pack |
| `build/` | Helper/support docs (Master Index, visit checklists, script run-order guides) |
| `archive/` | Superseded or empty docs kept for history |
| `scripts/` | Canonical audit-only PowerShell sources |
| `release/Mum PC Helper v1/` | Packaged product folder |
| `release/Mum-PC-Helper-v1.zip` | Downloadable v1 zip |
| `docs/` | The GitHub Pages page |

### Product sources (`product/`)
- Pack Start Here · Start Here · Quick Run Card · Visit Workflow One Pager
- Action Decision Tree · Safety Notes · User Guide

### Build / support (`build/`)
- Master Index · First Visit Checklist · Cleanup Order · What To Ask Mum · Session Notes
- Results Interpretation Guide · Run Order for Scripts · Browser Triage Guide
- Safe Tools List · Safe Scripts Plan · PowerShell guide docs
- Canonical Product Structure · Product Naming Rule · V1 Product Pack Definition

Full v1 zip: [`release/Mum-PC-Helper-v1.zip`](release/Mum-PC-Helper-v1.zip) (Start Here, Quick Guides, User Guide, Scripts, Safety Notes).

---

## Name

Renamed from Mum PC Helper to **PC Health Check Kit** in October 2026. The pack's file names still use the old name.

---

## Licence / use

Personal and learning use welcome. Treat the PowerShell scripts as audit-only tools on machines you are invited to support. Do not run them in bulk or unattended against machines you do not own or support.
