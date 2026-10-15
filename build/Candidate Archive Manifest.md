# Privacy-fixed candidate archive

Review candidate only. Not a published release or approved shop download.

- GitHub source: `ComicCoder23/pc-health-check-kit`, branch `codex/report-privacy-20261015`.
- Source commit: `4c5db62243449b568aa2bc77c0a6782b023ad2f5`, fetched from GitHub before packaging.
- Local candidate tag: `pc-kit-candidate-20261016-4c5db62`, pointing to that commit. Tag has not been pushed or approved as a release tag.
- Tree: `release/Mum PC Helper v1/` at that commit.
- Archive: `PC-Health-Check-Kit-candidate-a.zip`.
- Local cache: `D:\Media\PC-Health-Check-Kit\candidate-20261016-4c5db62\`.
- SHA256: `edac0ccd1a29df711fc4e506fff26f85242e03605158e01e78aa63c33db22b8b`.
- Toolchain: Git `2.53.0.windows.2`; verification Python `3.11.15`.

Rebuild in a checkout containing the pinned commit and the local candidate tag:

```powershell
$sourceTime = git show -s --format=%cI pc-kit-candidate-20261016-4c5db62
git -c core.autocrlf=false archive --format=zip "--mtime=$sourceTime" `
  '--prefix=Mum PC Helper v1/' --output=PC-Health-Check-Kit-candidate-a.zip `
  'pc-kit-candidate-20261016-4c5db62:release/Mum PC Helper v1'
Get-FileHash PC-Health-Check-Kit-candidate-a.zip -Algorithm SHA256
```

Two independent archive commands, separated by three seconds, produced identical
hashes. Explicit timestamps avoid the current-time default for subtree archives;
disabling automatic line-ending conversion keeps bytes equal to Git blobs.
An initial attempt without those settings failed byte/reproducibility checks;
the hash above belongs only to the corrected, verified archives.

Python zipfile verification compared the exact file set and all 21 file contents
against pinned `git show` blobs, checked duplicate/unsafe entry paths and
confirmed the report privacy helper and all six referenced guides are included.
All checks passed. No audit was executed. Independent review and the synthetic
privacy regression passed at script source `4c5db62`; independent guide
review and `node tests/pack-guides.mjs` passed at pinned source `152aa68`.
Archive verification here was performed by the implementing seat.

This supersedes the first 15-file candidate at `70a702e` (SHA256
`b9543c01c5b6553362f6ad842f015d8d76c96f095e03d370a1f81d4f995c5ff0`),
which lacked six guides referenced by the pack. Five guides are byte-exact
copies of existing build documents; the pack Master Index links to local files.
The missing-guide test failed before the additions and passed afterward.

The previous 21-file candidate at `152aa68` (SHA256
`47e768b050ec520f87eea66125702a2b80b8df4f6e36ba146f831f26cd0dfe18`)
is also superseded. A fake profile name containing spaces exposed partial path
disclosure; a new regression failed before the fix and passed at `4c5db62`.
Known profile roots are filtered before the generic path pattern, also covering
explicit roots containing `=`. Independent re-review at that commit found no
scoped blocker. Guide files are unchanged, so their passing tests were not repeated.

The existing tracked ZIP remains unchanged and stale. This local candidate is
not a public release tag, hosted delivery link, real-PC field test, approved
EULA, checkout test or sale-ready product. BOX-01 reviews the source and release
gates; the approved final artifact must be stored outside GitHub binaries under
the media storage rule. Candidate bytes must be rebuilt if packaged source changes.
