. (Join-Path $PSScriptRoot 'ReportPrivacy.ps1')
$desktop = [Environment]::GetFolderPath('Desktop')
$reportPath = Join-Path $desktop 'large-files-report.txt'
$userProfile = [Environment]::GetFolderPath('UserProfile')

$foldersToCheck = @(
    (Join-Path $userProfile 'Desktop'),
    (Join-Path $userProfile 'Documents'),
    (Join-Path $userProfile 'Downloads'),
    (Join-Path $userProfile 'Pictures'),
    (Join-Path $userProfile 'Videos')
)

$lines = @()
$lines += 'LARGE FILES REPORT'
$lines += ''
$lines += ('Run date: ' + (Get-Date))
$lines += ''
$lines += 'Top large files found in user folders:'
$lines += ''

$allFiles = @()

foreach ($folder in $foldersToCheck) {
    if (Test-Path $folder) {
        $files = Get-ChildItem -Path $folder -Recurse -File -ErrorAction SilentlyContinue
        $allFiles += $files
    }
}

$allFiles |
    Sort-Object Length -Descending |
    Select-Object -First 50 |
    ForEach-Object {
        $lines += ('{0:N2} MB | {1} | {2}' -f ($_.Length / 1MB), $_.LastWriteTime, $_.FullName)
    }

$lines += ''
$lines += 'Suggested manual review rules:'
$lines += '- Ask before touching personal files in Pictures or Videos'
$lines += '- Large installers and archives may be easier wins'
$lines += '- Unknown large files should be noted, not deleted automatically'
$lines += '- Use this report alongside Disk Space Audit and Downloads Audit'

$lines | Protect-ReportText | Out-File -FilePath $reportPath -Encoding UTF8
Write-Host 'Large file scan complete. Report saved to:' $reportPath
