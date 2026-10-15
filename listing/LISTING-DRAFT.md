# PC Health Check Kit

Draft shop listing for review. This is not an offer to sell, and it is not published.

PC Health Check Kit is a short set of plain-English notes and five read-only PowerShell checks for a slow or cluttered home Windows PC.

**What you pay for:** You pay for a packaged folder of plain-English visit guides, safety notes and the five audit scripts in their locked run order, and the same scripts stay free and public on GitHub.

The free scripts, and the same packaged zip, are already public at https://github.com/ComicCoder23/pc-health-check-kit (the zip is `release/Mum-PC-Helper-v1.zip`). A shop download is that folder. The free copy stays up.

The public name is PC Health Check Kit. Inside the folder the files still use the old name, Mum PC Helper.

## Who it is for

For a first careful look at a home or family Windows PC, by someone the owner has asked to help. The Start Here page lists slow PCs, cluttered desktops and downloads, low disk space, startup clutter, confusing home PC setups, and light browser clutter checks.

The user guide says it is a guided first pass. It also says it is not a deep repair suite, not an aggressive cleanup tool, not a malware removal toolkit, and not a promise to fix every problem in one visit.

Some pages still say "Mum", because the file names have not been renamed yet. Read that as the person who uses the PC.

## What you get in the download

The folder is `Mum PC Helper v1`, also packed as `Mum-PC-Helper-v1.zip`.

- Start Here
- Quick Run Card
- Visit Workflow One Pager
- Action Decision Tree
- User Guide
- Safety Notes
- Five PowerShell scripts, in `04 Scripts`
- Script notes, including how to run a script and the safety boundary
- `Version.txt` (it says Mum PC Helper v1.0, scripts audit-only)

A short visit, as the Quick Run Card and the user guide describe it:

1. Open Start Here, then the Quick Run Card and the Safety Notes.
2. Ask what feels slow, what the PC is used for, and what must be left alone.
3. Run `DiskSpaceAudit.ps1`, then `DownloadsAudit.ps1`.
4. By hand, clear obvious junk from Downloads and tidy obvious Desktop clutter.
5. Empty the Recycle Bin and check free space again.
6. Write down what you ran, what you changed, and what you left alone.
7. Only if still needed: `LargeFilesFinder.ps1`, then `InstalledProgramsExport.ps1`, then `StartupItemsReview.ps1`.

That tidying is manual. The scripts do not do it. The safety rule in the notes is: audit first, clean second, delete last. If you are unsure, leave it.

## What it does / What it never does

Each script reads, then writes one plain text report on the Desktop, and stops.

| Order | Script | Report on the Desktop | What it reads |
|---|---|---|---|
| 1, always first | `DiskSpaceAudit.ps1` | `disk-space-audit.txt` | Free and total space on each filesystem drive, and the size of Desktop, Documents, Downloads, Pictures and Videos |
| 2, usual second | `DownloadsAudit.ps1` | `downloads-audit.txt` | Files in the Downloads folder itself (not folders inside it): the 20 largest, up to 50 files older than 90 days, and `.exe`, `.msi`, `.msix`, `.zip`, `.rar` and `.7z` files |
| 3, only if space is still unexplained | `LargeFilesFinder.ps1` | `large-files-report.txt` | The 50 largest files under Desktop, Documents, Downloads, Pictures and Videos |
| 4, only if an apps review is needed | `InstalledProgramsExport.ps1` | `installed-programs-review.txt` | Name, version, publisher and uninstall command from the usual Windows uninstall lists. It does not run that command |
| 5, only if startup is still slow | `StartupItemsReview.ps1` | `startup-items-review.txt` | The Run registry keys and the Startup folders. It does not turn anything off |

The safety notes say the scripts do not:

- delete files
- move files
- modify registry entries
- uninstall programs
- touch Windows system folders
- run as administrator unless you explicitly do so

Reading the five scripts matches that list. They also contain no rename, no web or network call, and no read of passwords or saved credentials. The report is a text file on that PC's Desktop. Nothing in the scripts sends it anywhere.

If a script asks for administrator access you did not expect, do not approve it. Close it and check the file matches the copy in this folder.

The reports are there so you can see what is on the PC. They are not permission to delete things blindly. The safety notes say to leave system folders, unknown files, Windows components, security software, printer software still in use, and saved passwords or browser account data alone unless the person has agreed.

## Windows requirements

- A Windows PC. The checks are Windows PowerShell scripts.
- The safe-scripts plan chose PowerShell because it is built into Windows.
- Run them as the person who is logged in.
- Windows may block a script. The safety notes say you can allow it for that PowerShell window only:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Closing the window clears that change.

The repository does not state a minimum Windows version or a minimum PowerShell version.

## In the public repo, not in the packaged folder

These notes exist in the repository. They are not inside the zip. The Quick Run Card and the visit workflow still tell you to open some of them.

- Master Index
- First Visit Checklist
- What To Ask Mum (a fuller question list; shorter questions are already in the user guide and the visit workflow)
- Session Notes (a blank visit log)
- Results Interpretation Guide (how to read the reports)
- Run Order for Scripts (the same order is already written in Start Here, the Quick Run Card and the script notes)
- Browser Triage Guide
- Cleanup Order, Safe Tools List, Safe Scripts Plan, and the other build notes

## Planned, not yet included

- Browser helper script
- Printable PDF
- One-click launcher

## Not tested yet

The Windows field test has not happened yet. This listing includes no testimonials, user counts or results.

## Price, licence and support

Intended sale: United Kingdom, in pounds. The shop and the checkout page are not decided. This draft has no price figure and no checkout link.

Price, in pounds: [PRICE: owner sets]

The kit is sold under a proprietary EULA that is still in draft. [EULA: pending approval]

Support and refunds: [SUPPORT AND REFUNDS LINE: BOX-01 drafts]

Do not publish this page until those three lines are filled in and a reviewer has agreed the wording.

---

## Reviewer notes (not shop copy)

Check 4 draft for BOX-01. Nobody should merge, publish, tag or list this from this file alone.

Claim sources:

| Listing claim | Repo files |
|---|---|
| Public name PC Health Check Kit; files still say Mum PC Helper; zip path | `README.md`, `release/Mum PC Helper v1/Version.txt` |
| Packaged folder and zip contents | `release/Mum PC Helper v1/` and `release/Mum-PC-Helper-v1.zip` |
| Scripts stay free; GitHub is the script source | `README.md`, `docs/index.html`, `release/Mum PC Helper v1/01 Start Here/Mum PC Helper - Start Here.md` |
| Who it is for, and what it is not | `release/Mum PC Helper v1/01 Start Here/Mum PC Helper - Start Here.md`, `release/Mum PC Helper v1/03 User Guide/Mum PC Helper - User Guide.md`, `README.md` (use on machines you are invited to support) |
| Visit steps and locked order | `release/Mum PC Helper v1/02 Quick Guides/Mum PC Helper - Quick Run Card.md`, `release/Mum PC Helper v1/02 Quick Guides/Mum PC Helper - Visit Workflow One Pager.md`, `release/Mum PC Helper v1/05 Script Notes/README.md`, `release/Mum PC Helper v1/05 Script Notes/Safety-Notes.txt` |
| What each script reads, and the report file name | `scripts/DiskSpaceAudit.ps1`, `scripts/DownloadsAudit.ps1`, `scripts/LargeFilesFinder.ps1`, `scripts/InstalledProgramsExport.ps1`, `scripts/StartupItemsReview.ps1` (the copies under `release/Mum PC Helper v1/04 Scripts/` match these) |
| What the scripts must not do; unexpected admin prompt; execution-policy command | `scripts/Safety-Notes.txt` and `release/Mum PC Helper v1/05 Script Notes/Safety-Notes.txt` |
| No rename, no network, no credential read | The five `.ps1` files above (those calls are not in them) |
| Run as the logged-in user | `README.md` |
| PowerShell is built into Windows | `build/Mum PC Helper - Safe Scripts Plan.md` |
| No minimum Windows or PowerShell version is stated | No file in the repo states one |
| Manual cleanup rules, including passwords and system folders | `release/Mum PC Helper v1/02 Quick Guides/Mum PC Helper - Safety Notes.md` |
| Notes that exist but are outside the zip | `build/` (see `build/Mum PC Helper - V1 Product Pack Definition.md`, section "WHAT STAYS OUT OF THE V1 PRODUCT") |
| Browser helper script, printable PDF, one-click launcher are later work | `AGENTS.md` (parked items) |
| Not yet run on another PC | `README.md` |
| Price, EULA and support line | Placeholders only. No `LICENSE` file was added or changed |
