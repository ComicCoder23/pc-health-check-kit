# Privacy-fixed candidate archive

Review candidate only. Not a published release or approved shop download.

- GitHub source: `ComicCoder23/pc-health-check-kit`, branch `codex/report-privacy-20261015`.
- Source commit: `70a702e628351612276fb7225faf52987419911d`, fetched from GitHub before packaging.
- Local candidate tag: `pc-kit-candidate-20261015-70a702e`, pointing to that commit. Tag has not been pushed or approved as a release tag.
- Tree: `release/Mum PC Helper v1/` at that commit.
- Archive: `PC-Health-Check-Kit-candidate-a.zip`.
- Local cache: `D:\Media\PC-Health-Check-Kit\candidate-20261015-70a702e\`.
- SHA256: `b9543c01c5b6553362f6ad842f015d8d76c96f095e03d370a1f81d4f995c5ff0`.
- Toolchain: Git `2.53.0.windows.2`; verification Python `3.11.15`.

Rebuild in a checkout containing the pinned commit and the local candidate tag:

```powershell
$sourceTime = git show -s --format=%cI pc-kit-candidate-20261015-70a702e
git -c core.autocrlf=false archive --format=zip "--mtime=$sourceTime" `
  '--prefix=Mum PC Helper v1/' --output=PC-Health-Check-Kit-candidate-a.zip `
  'pc-kit-candidate-20261015-70a702e:release/Mum PC Helper v1'
Get-FileHash PC-Health-Check-Kit-candidate-a.zip -Algorithm SHA256
```

Two independent archive commands, separated by three seconds, produced identical
hashes. Explicit timestamps avoid the current-time default for subtree archives;
disabling automatic line-ending conversion keeps bytes equal to Git blobs.
An initial attempt without those settings failed byte/reproducibility checks;
the hash above belongs only to the corrected, verified archives.

Python zipfile verification compared the exact file set and all 15 file contents
against pinned `git show` blobs, checked duplicate/unsafe entry paths and
confirmed the report privacy helper is included. All checks passed. No audit was
executed. Independent source review and the synthetic privacy regression passed
at the pinned source commit; packaging verification here was performed by the
implementing seat, not independently reviewed.

The existing tracked ZIP remains unchanged and stale. This local candidate is
not a public release tag, hosted delivery link, real-PC field test, approved
EULA, checkout test or sale-ready product. BOX-01 reviews the source and release
gates; the approved final artifact must be stored outside GitHub binaries under
the media storage rule. Candidate bytes must be rebuilt if packaged source changes.
