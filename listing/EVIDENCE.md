# Evidence for the shop listing

Reviewer-only. This is not shop copy. Do not paste this file into the listing, and do not publish it as the product page.

Check 5 refresh for BOX-01. Draft only. Nobody should merge, publish, tag or list the product from this file alone.

## Candidate archive

The shop listing follows the privacy-fixed candidate on pull request #7 (`codex/report-privacy-20261015`).

- Archive name: `PC-Health-Check-Kit-CANDIDATE-4c5db62.zip`
- SHA-256: `edac0ccd1a29df711fc4e506fff26f85242e03605158e01e78aa63c33db22b8b`
- File count: 21
- Byte size: about 23986 bytes
- Pinned source commit: `4c5db62243449b568aa2bc77c0a6782b023ad2f5`

Evidence for the hash and the 21 files is `build/Candidate Archive Manifest.md` on that branch. The archive file name comes from the Codex handoff on AI_Control_Tower#27, comment 6204276790.

The candidate is held privately by the owner. Its location is recorded on AI_Control_Tower#27, comment 6204276790. It is not a public shop URL, and it is not a buyer checkout download.

## Supersession

That candidate supersedes the 15-file archive at `70a702e` (SHA256 `b9543c01c5b6553362f6ad842f015d8d76c96f095e03d370a1f81d4f995c5ff0`) and the 21-file archive at `152aa68` (SHA256 `47e768b050ec520f87eea66125702a2b80b8df4f6e36ba146f831f26cd0dfe18`).

## Stale master zip

`release/Mum-PC-Helper-v1.zip` on `master` is unchanged and stale. Its contents are the older guides and five scripts. It has no `ReportPrivacy.ps1` and none of the six guides added in the candidate. It is not the paid candidate.

The six guides now inside the candidate, and absent from the master zip, are Master Index, First Visit Checklist, What To Ask Mum, Session Notes, Results Interpretation Guide, and Browser Triage Guide. Run Order for Scripts remains under `build/` only. `build/Mum PC Helper - V1 Product Pack Definition.md` still lists those six guides under "WHAT STAYS OUT OF THE V1 PRODUCT"; the candidate tree is ahead of that note.

## Claim sources

The shop listing no longer states the archive name, hash, file count, byte size, source commit, or pull request. Those facts are recorded above. The other rows are where the listing wording was checked.

| Listing claim | Where it was checked |
|---|---|
| Public name is PC Health Check Kit; older folder title appears once, later | `README.md`; candidate `release/Mum PC Helper v1/Version.txt` at `4c5db62` |
| Candidate archive name, SHA-256, 21 files, byte size; held privately by the owner (not a public shop URL) | Hash and file count: `build/Candidate Archive Manifest.md` on pull request #7; release tree at `4c5db62243449b568aa2bc77c0a6782b023ad2f5`. File name and private location: Codex handoff, AI_Control_Tower#27 comment 6204276790 |
| Earlier candidate hashes are superseded | Same manifest (15-file `b9543c01…` at `70a702e`; 21-file `47e768b0…` at `152aa68`) |
| Public main-branch zip is the stale older pack | `release/Mum-PC-Helper-v1.zip` on `master` (file list: original guides and five scripts only) |
| Scripts stay free; GitHub is the script source | `README.md`, `docs/index.html`, candidate Start Here |
| Guides and helper inside the candidate | `git ls-tree` of `release/Mum PC Helper v1/` at `4c5db62` (21 files, listed in the shop section) |
| Who it is for, and what it is not | Candidate Start Here, candidate User Guide, `README.md` |
| Visit steps and locked order | Candidate Quick Run Card, Visit Workflow One Pager, script-notes README, Safety-Notes.txt, Master Index |
| What each script reads, and the report file name | The five audit `.ps1` files at `4c5db62` (repo `scripts/` and `release/.../04 Scripts/`) |
| Report filter: commands, paths, labelled secrets; reports can still identify | `ReportPrivacy.ps1` at `4c5db62` (`Protect-ReportText`); candidate Master Index line on reviewing reports before sharing |
| What the scripts must not do; unexpected admin prompt; execution-policy command | `scripts/Safety-Notes.txt` and the candidate script notes |
| No rename, no network, no credential read | The five audit scripts and `ReportPrivacy.ps1` at `4c5db62` |
| Run as the logged-in user | `README.md` |
| PowerShell is built into Windows | `build/Mum PC Helper - Safe Scripts Plan.md` |
| No minimum Windows or PowerShell version is stated | No file in the repo states one |
| Manual cleanup rules, including passwords and system folders | Candidate Safety Notes |
| Notes that remain outside the candidate | `build/` files not present under `release/Mum PC Helper v1/` at `4c5db62`, including Run Order for Scripts |
| Browser helper script, printable PDF, one-click launcher are later work | `AGENTS.md` (parked items) |
| Not yet run on another PC | `README.md` |
| Price, EULA and support line | Placeholders only. No licence file was added or changed |
