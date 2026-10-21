# PC Health Check Kit — PowerShell Scripts

Five audit scripts for Windows PC checks. They read system and user-folder information, then write a plain-text report to the Desktop. They do not delete, move, or modify existing user files.

Use this run order every time. It matches `build/Mum PC Helper - Run Order for Scripts.md` and `product/Mum PC Helper - Quick Run Card.md`.

## Run order

1. **DiskSpaceAudit.ps1** — Always first. Shows drive space and user folder sizes.
2. **DownloadsAudit.ps1** — Usual second step. Flags large/old downloads and likely installer clutter.
3. **LargeFilesFinder.ps1** — Only if space is still tight or unexplained after Downloads cleanup.
4. **InstalledProgramsExport.ps1** — Only if the PC is still slow or full of unknown apps.
5. **StartupItemsReview.ps1** — Only if startup is still sluggish.

## Fast default path

For most visits:

1. DiskSpaceAudit.ps1
2. DownloadsAudit.ps1
3. Manual cleanup of obvious Downloads/Desktop junk
4. Empty Recycle Bin and recheck free space
5. Write Session Notes
6. Only then decide on scripts 3–5

## How to run a script

1. Read `Safety-Notes.txt` and the relevant guide first.
2. Run the `.ps1` file as the logged-in user, without administrator access.
3. Find the plain-text report on the Desktop and review it before deciding on any manual cleanup.

If Windows or an organisation's policy blocks a script, stop and check with the PC owner or administrator. Do not change execution policy to get around a block.

## Safety guarantee

The scripts do not change system settings or existing user files. They read folder sizes, file listings, and selected registry values, then write one report file to the Desktop. The report is a new file and should be handled with the PC owner's permission.

Read `Safety-Notes.txt` in this folder and `product/Mum PC Helper - Safety Notes.md` before making any manual changes.
