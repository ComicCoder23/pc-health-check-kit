# Pure report-text filtering; this helper performs no audit or file access.
function Protect-ReportText {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [AllowEmptyString()]
        [string]$Text,
        [string[]]$PrivateRoots = @($env:USERPROFILE)
    )
    process {
        # Withhold the entire command: unrecognised flags can also contain secrets.
        $safe = $Text -replace '(?is)^(\s*(?:Command|Uninstall):\s*).*$', '$1[REDACTED command]'
        # Keep measurements separated by '=' or '|', withholding the complete path.
        $safe = $safe -replace '(?i)[a-z]:\\Users\\[^\\\s|=]+(?:\\[^|=\r\n]*)?', '[USER_PATH]'
        foreach ($privateRoot in $PrivateRoots) {
            if (-not [string]::IsNullOrWhiteSpace($privateRoot)) {
                $pattern = '(?i)' + [regex]::Escape($privateRoot.TrimEnd('\')) + '(?=\\|\s|$)(?:\\[^|=\r\n]*)?'
                $safe = $safe -replace $pattern, '[USER_PATH]'
            }
        }
        # Defensive filtering for labelled secrets outside the withheld command fields.
        $safe = $safe -replace '(?i)(\b(?:api[_-]?key|access[_-]?token|refresh[_-]?token|token|password|client[_-]?secret|authorization)\s*[:=]\s*).*$', '$1[REDACTED]'
        $safe = $safe -replace '(?i)\bBearer\s+\S+', 'Bearer [REDACTED]'
        $safe
    }
}
