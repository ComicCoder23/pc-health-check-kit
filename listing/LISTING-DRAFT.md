# PC Health Check Kit

Draft shop listing for review. This is not an offer to sell, and it is not published.

PC Health Check Kit is a short set of plain-English notes and five read-only PowerShell checks for a slow or cluttered home Windows PC.

**What you pay for:** You pay for a packaged visit kit: plain-English guides, safety notes, and the five audit scripts in their locked run order, with a report privacy helper kept beside the scripts. The scripts stay free on GitHub. The paid pack is that packaged folder.

The free scripts are public at https://github.com/ComicCoder23/pc-health-check-kit. The only zip on the public main branch is an older pack. It is stale. It is the earlier set of guides and five scripts, and it is not the copy for sale.

## Who it is for

For a first careful look at a home or family Windows PC, by someone the owner has asked to help. The Start Here page lists slow PCs, cluttered desktops and downloads, low disk space, startup clutter, confusing home PC setups, and light browser clutter checks.

The user guide says it is a guided first pass. It also says it is not a deep repair suite, not an aggressive cleanup tool, not a malware removal toolkit, and not a promise to fix every problem in one visit.

## What you get in the download

The download is the pack for sale.

Inside that download, the folder and the guide file names still use an older title, Mum PC Helper. `Version.txt` records that same title at version 1.0 and says the scripts are audit-only. Where a page says "Mum", read that as the person who uses the PC.

Guides in the download:

- Master Index
- Start Here
- Quick Run Card
- Visit Workflow One Pager
- Action Decision Tree
- Safety Notes
- User Guide
- First Visit Checklist
- What To Ask Mum (a question list for the person who uses the PC)
- Session Notes (a blank visit log)
- Results Interpretation Guide (how to read the reports)
- Browser Triage Guide

Scripts, in `04 Scripts`:

- `DiskSpaceAudit.ps1`
- `DownloadsAudit.ps1`
- `LargeFilesFinder.ps1`
- `InstalledProgramsExport.ps1`
- `StartupItemsReview.ps1`
- `ReportPrivacy.ps1` (filters report text; the five checks load it; it is not a separate visit check and it does not inspect the PC)

Also included: script notes (how to run a script, and the safety boundary) and `Version.txt`.

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

Each script reads, then writes one plain text report on the Desktop, and stops. The five checks pass that text through `ReportPrivacy.ps1` before the report is saved.

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

Reading the five scripts and `ReportPrivacy.ps1` matches that list. They also contain no rename, no web or network call, and no read of passwords or saved credentials. The report is a text file on that PC's Desktop. Nothing in the scripts sends it anywhere.

The filter withholds uninstall and command lines, replaces known user-folder paths, and redacts labelled secrets such as passwords and tokens. A report is not anonymous. File names, software names, custom paths and unlabelled text can still identify the person or the PC. Read the report before you share it.

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

## Still only in the repository

These build notes are not inside the download. The visit order they describe is already written in the Master Index, Start Here, the Quick Run Card and the script notes.

- Run Order for Scripts
- Cleanup Order
- Safe Tools List
- Safe Scripts Plan
- Canonical Product Structure
- The other build notes (per-script write-ups, the product naming rule, the pack definition, the report privacy check, and the candidate archive manifest)

## Planned, not yet included

- Browser helper script
- Printable PDF
- One-click launcher

## Not tested yet

The Windows field test has not happened yet. This listing includes no testimonials, user counts or results.

## Price, licence and support

Intended sale: United Kingdom, in pounds. The shop and the checkout page are not decided. This draft has no price figure and no checkout link.

Price, in pounds: £9

The kit is sold by Gumroad as merchant of record and licensed under the PC Health Check Kit EULA.

Support and refunds: Support: email **[SUPPORT EMAIL]** and we reply within 2 working days. Refunds: if it won't run on your Windows PC, or you're not happy, tell us within 14 days of buying and we'll refund you in full, no questions asked. This sits on top of your legal rights.

Do not publish this page until those three lines are filled in and a reviewer has agreed the wording.
