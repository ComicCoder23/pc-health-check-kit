. (Join-Path $PSScriptRoot 'ReportPrivacy.ps1')
$desktop = [Environment]::GetFolderPath('Desktop')
$reportPath = Join-Path $desktop 'startup-items-review.txt'

$registryStartupPaths = @(
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run',
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Run',
    'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run'
)

$startupFolders = @(
    [Environment]::GetFolderPath('Startup'),
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
)

$lines = @()
$lines += 'STARTUP ITEMS REVIEW'
$lines += ''
$lines += ('Run date: ' + (Get-Date))
$lines += ''
$lines += 'Registry startup entries:'
$lines += ''

foreach ($path in $registryStartupPaths) {
    $lines += ('Source: ' + $path)
    if (Test-Path $path) {
        $item = Get-ItemProperty -Path $path -ErrorAction SilentlyContinue
        if ($item) {
            $props = $item.PSObject.Properties | Where-Object { $_.Name -notlike 'PS*' }
            if ($props.Count -gt 0) {
                foreach ($prop in $props) {
                    $lines += ('Name: ' + $prop.Name)
                    $lines += ('Command: ' + [string]$prop.Value)
                    $lines += ''
                }
            }
            else {
                $lines += 'No startup items found.'
                $lines += ''
            }
        }
    }
    else {
        $lines += 'Path not found.'
        $lines += ''
    }
}

$lines += 'Startup folder entries:'
$lines += ''

foreach ($folder in $startupFolders) {
    $lines += ('Folder: ' + $folder)
    if (Test-Path $folder) {
        $files = Get-ChildItem -Path $folder -Force -ErrorAction SilentlyContinue
        if ($files.Count -gt 0) {
            foreach ($file in $files) {
                $lines += ('Item: ' + $file.Name)
                $lines += ('Path: ' + $file.FullName)
                $lines += ''
            }
        }
        else {
            $lines += 'No startup items found.'
            $lines += ''
        }
    }
    else {
        $lines += 'Folder not found.'
        $lines += ''
    }
}

$lines += 'Suggested review questions:'
$lines += '- Do you recognize this startup item?'
$lines += '- Is it essential every time the PC starts?'
$lines += '- Is it printer, security, sound, or system related?'
$lines += '- If unsure, leave it enabled for now.'

$lines | Protect-ReportText | Out-File -FilePath $reportPath -Encoding UTF8
Write-Host 'Review complete. Report saved to:' $reportPath
