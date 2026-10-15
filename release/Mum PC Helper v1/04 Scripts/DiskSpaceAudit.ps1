. (Join-Path $PSScriptRoot 'ReportPrivacy.ps1')
$desktop = [Environment]::GetFolderPath('Desktop')
$reportPath = Join-Path $desktop 'disk-space-audit.txt'
$userProfile = [Environment]::GetFolderPath('UserProfile')

$foldersToCheck = @(
    (Join-Path $userProfile 'Desktop'),
    (Join-Path $userProfile 'Documents'),
    (Join-Path $userProfile 'Downloads'),
    (Join-Path $userProfile 'Pictures'),
    (Join-Path $userProfile 'Videos')
)

function Get-FolderSizeMB {
    param([string]$Path)
    if (-not (Test-Path $Path)) { return 'Missing' }
    try {
        $size = (Get-ChildItem -Path $Path -Recurse -File -ErrorAction SilentlyContinue |
            Measure-Object -Property Length -Sum).Sum
        if ($null -eq $size) { return '0 MB' }
        return ('{0:N2} MB' -f ($size / 1MB))
    }
    catch { return 'Access error' }
}

$lines = @()
$lines += 'DISK SPACE AUDIT'
$lines += ''
$lines += ('Run date: ' + (Get-Date))
$lines += ''
$lines += 'Drive summary:'

Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    $used = $_.Used
    $free = $_.Free
    $total = $used + $free
    if ($total -gt 0) {
        $lines += ('Drive {0}: Free {1:N2} GB / Total {2:N2} GB' -f $_.Name, ($free / 1GB), ($total / 1GB))
    }
}

$lines += ''
$lines += 'User folder sizes:'

foreach ($folder in $foldersToCheck) {
    $size = Get-FolderSizeMB -Path $folder
    $lines += ('{0} = {1}' -f $folder, $size)
}

$lines | Protect-ReportText | Out-File -FilePath $reportPath -Encoding UTF8
Write-Host 'Audit complete. Report saved to:' $reportPath
