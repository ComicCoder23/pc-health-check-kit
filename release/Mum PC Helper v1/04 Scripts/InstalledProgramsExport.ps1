. (Join-Path $PSScriptRoot 'ReportPrivacy.ps1')
$desktop = [Environment]::GetFolderPath('Desktop')
$reportPath = Join-Path $desktop 'installed-programs-review.txt'

$registryPaths = @(
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
)

$programs = foreach ($path in $registryPaths) {
    Get-ItemProperty $path -ErrorAction SilentlyContinue |
        Where-Object { $_.DisplayName } |
        Select-Object `
            @{Name='Name';Expression={$_.DisplayName}},`
            @{Name='Version';Expression={$_.DisplayVersion}},`
            @{Name='Publisher';Expression={$_.Publisher}},`
            @{Name='Uninstall';Expression={$_.UninstallString}}
}

$programs = $programs | Sort-Object Name -Unique

$lines = @()
$lines += 'INSTALLED PROGRAMS REVIEW'
$lines += ''
$lines += ('Run date: ' + (Get-Date))
$lines += ('Total programs found: ' + $programs.Count)
$lines += ''

foreach ($program in $programs) {
    $lines += ('Name: ' + $program.Name)
    $lines += ('Version: ' + ($program.Version -as [string]))
    $lines += ('Publisher: ' + ($program.Publisher -as [string]))
    $lines += ('Uninstall: ' + ($program.Uninstall -as [string]))
    $lines += ''
}

$lines += 'Suggested review questions:'
$lines += '- Do you still use this?'
$lines += '- Do you know what this is?'
$lines += '- Was this installed with something else?'
$lines += '- Is this printer, browser, security, or Windows related?'
$lines += '- If unsure, leave it alone for now.'

$lines | Protect-ReportText | Out-File -FilePath $reportPath -Encoding UTF8
Write-Host 'Export complete. Report saved to:' $reportPath
