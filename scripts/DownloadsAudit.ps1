. (Join-Path $PSScriptRoot 'ReportPrivacy.ps1')
$desktop = [Environment]::GetFolderPath('Desktop')
$downloads = [Environment]::GetFolderPath('UserProfile') + '\Downloads'
$reportPath = Join-Path $desktop 'downloads-audit.txt'

$now = Get-Date
$oldThreshold = $now.AddDays(-90)
$installerExtensions = @('.exe', '.msi', '.msix', '.zip', '.rar', '.7z')

$lines = @()
$lines += 'DOWNLOADS FOLDER AUDIT'
$lines += ''
$lines += ('Run date: ' + $now)
$lines += ('Downloads folder: ' + $downloads)
$lines += ''

if (-not (Test-Path $downloads)) {
    $lines += 'Downloads folder not found.'
    $lines | Protect-ReportText | Out-File -FilePath $reportPath -Encoding UTF8
    Write-Host 'Audit complete. Report saved to:' $reportPath
    return
}

$files = Get-ChildItem -Path $downloads -File -ErrorAction SilentlyContinue

$lines += ('Total files found: ' + $files.Count)
$lines += ''

$lines += 'Largest files:'
$files |
    Sort-Object Length -Descending |
    Select-Object -First 20 |
    ForEach-Object {
        $lines += ('{0:N2} MB | {1} | {2}' -f ($_.Length / 1MB), $_.LastWriteTime, $_.Name)
    }

$lines += ''
$lines += 'Older than 90 days:'
$files |
    Where-Object { $_.LastWriteTime -lt $oldThreshold } |
    Sort-Object LastWriteTime |
    Select-Object -First 50 |
    ForEach-Object {
        $lines += ('{0} | {1:N2} MB | {2}' -f $_.LastWriteTime, ($_.Length / 1MB), $_.Name)
    }

$lines += ''
$lines += 'Likely installers / archives:'
$files |
    Where-Object { $installerExtensions -contains $_.Extension.ToLower() } |
    Sort-Object LastWriteTime |
    ForEach-Object {
        $lines += ('{0} | {1:N2} MB | {2}' -f $_.LastWriteTime, ($_.Length / 1MB), $_.Name)
    }

$lines += ''
$lines += 'Suggested manual review rules:'
$lines += '- Check old installers first'
$lines += '- Check zip files already extracted'
$lines += '- Check large files you do not recognize'
$lines += '- Leave uncertain files alone until reviewed'

$lines | Protect-ReportText | Out-File -FilePath $reportPath -Encoding UTF8
Write-Host 'Audit complete. Report saved to:' $reportPath
