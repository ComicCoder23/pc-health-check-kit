# Report privacy check

The five audit reports now pass through `scripts/ReportPrivacy.ps1` before writing.
The release folder includes an identical helper and identical audit scripts.
Keep the helper beside the scripts; a missing helper stops report generation.

Command and uninstall command fields are withheld completely, including unknown
flags. Standard Windows user profile paths and the current profile root are
replaced with `[USER_PATH]`. Labelled token, password, API key and bearer values
are also filtered. Drive totals and separate size measurements remain readable.

This reduces accidental disclosure; it does not make a report anonymous.
File names, software names, dates, custom paths outside the current profile and
unlabelled sensitive text can still identify someone. Review each report before
sharing. The saved report location shown in the local console remains a local
path so the helper can find it.

Verification: `powershell.exe -NoProfile -File tests/report-privacy.ps1` uses only
invented strings, parses the five scripts without running them, checks every
Out-File report pipeline and compares source/release script hashes. It does not
read the registry, inspect user folders, or run an audit.

The existing tracked ZIP predates this change. It must not be presented as the
privacy-fixed download. Reproducible packaging from the reviewed source commit,
a pinned source tag, archive hash and extracted-content verification remain a
separate release gate. A local tagged-source candidate has now been verified;
see `Candidate Archive Manifest.md` for the pinned commit, reproducible command
and hash. Public release tagging/delivery remains held. No field test, sale
readiness or publication is claimed.
