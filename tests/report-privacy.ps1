# Codex (local desktop, ALAN-STUDIO), 2026-10-15. Pure synthetic strings only.
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$helper = Join-Path $root 'scripts/ReportPrivacy.ps1'
if (-not (Test-Path -LiteralPath $helper)) { throw 'Report privacy helper is missing; current report outputs are unredacted.' }
. $helper
$fixtureToken = 'FAKE_TEST_TOKEN_NEVER_VALID_9384'
$fixturePath = 'C:\Users\FixturePerson\Documents\Private Note.txt'
$inputLines = @(
    "Command: app.exe --token $fixtureToken --other unrecognised-secret",
    "Uninstall: app.exe /password:$fixtureToken",
    "Path: $fixturePath",
    'D:\Profiles\FixturePerson\Desktop = 12 MB',
    "api_key=$fixtureToken",
    "Authorization: Bearer $fixtureToken",
    ('Command: app.exe --config="' + $fixturePath + '" --secret="' + $fixtureToken + '"'),
    'c:\USERS\FixturePerson\Desktop\file.txt | 14 MB',
    'Path: C:\Users\Fixture Full Name\Documents\private.txt',
    'Path: C:\Users\Fixture=Name\Documents\private.txt',
    "Command: app.exe`n--unknown-secret MULTILINE_COMMAND_SECRET",
    "Uninstall: app.exe`r`n/private MULTILINE_UNINSTALL_SECRET",
    'Drive C: Free 10 GB / Total 20 GB'
)
$result = ($inputLines | Protect-ReportText -PrivateRoots @('D:\Profiles\FixturePerson', 'C:\Users\Fixture=Name')) -join "`n"
foreach ($private in @($fixtureToken, $fixturePath, 'FixturePerson', 'unrecognised-secret',
    'MULTILINE_COMMAND_SECRET', 'MULTILINE_UNINSTALL_SECRET', 'Fixture Full Name', 'Full Name\Documents', 'Fixture=Name')) {
    if ($result.Contains($private)) { throw 'Synthetic private value survived redaction' }
}
if (-not $result.Contains('Drive C: Free 10 GB / Total 20 GB')) { throw 'Safe audit measurements changed' }
if (-not $result.Contains('[REDACTED command]')) { throw 'Raw command fields must be withheld entirely' }
if (-not $result.Contains('[USER_PATH]')) { throw 'User paths must be replaced' }
if (-not $result.Contains('| 14 MB')) { throw 'Path filtering removed a file measurement' }
if (-not $result.Contains('= 12 MB')) { throw 'Custom profile filtering removed a folder measurement' }
$plain = 'Installed program: Example Tool 1.0 (Example Publisher)'
if (($plain | Protect-ReportText) -ne $plain) { throw 'Safe program metadata changed' }
$helperTokens = $null; $helperErrors = $null
$null = [Management.Automation.Language.Parser]::ParseFile($helper, [ref]$helperTokens, [ref]$helperErrors)
if ($helperErrors.Count) { throw 'Helper parse error' }

# Static wiring/parity/parser checks only. NEVER execute audit scripts.
$audits = @('DiskSpaceAudit.ps1','DownloadsAudit.ps1','LargeFilesFinder.ps1',
    'InstalledProgramsExport.ps1','StartupItemsReview.ps1')
foreach ($name in $audits) {
    $source = Join-Path $root ('scripts/' + $name)
    $pack = Join-Path $root ('release/Mum PC Helper v1/04 Scripts/' + $name)
    $text = [IO.File]::ReadAllText($source)
    if ($text -notmatch 'ReportPrivacy\.ps1') { throw "Missing helper load: $name" }
    $tokens = $null; $errors = $null
    $ast = [Management.Automation.Language.Parser]::ParseFile($source, [ref]$tokens, [ref]$errors)
    if ($errors.Count) { throw "Parse error: $name" }
    $writes = $ast.FindAll({ param($n)
        $n -is [Management.Automation.Language.PipelineAst] -and $n.Extent.Text -match '\|\s*Out-File'
    }, $true)
    if (-not $writes.Count) { throw "No report output found: $name" }
    foreach ($write in $writes) {
        if ($write.Extent.Text -notmatch '\|\s*Protect-ReportText\s*\|\s*Out-File') {
            throw "Unredacted report output: $name"
        }
    }
    if ((Get-FileHash -LiteralPath $source).Hash -ne (Get-FileHash -LiteralPath $pack).Hash) {
        throw "Source/release mismatch: $name"
    }
}
$packHelper = Join-Path $root 'release/Mum PC Helper v1/04 Scripts/ReportPrivacy.ps1'
if ((Get-FileHash -LiteralPath $helper).Hash -ne (Get-FileHash -LiteralPath $packHelper).Hash) {
    throw 'Pack helper differs from source'
}
Write-Output 'PASS: fake token/user paths redacted; safe measurements retained; all five output paths wired and mirrored. No audit executed.'
