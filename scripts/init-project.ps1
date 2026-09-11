# Copy DESIGN.md, tokens, and the project Cursor rule into a target repo.
# Usage: pwsh -File scripts/init-project.ps1 -Target C:\path\to\app [-Force]

param(
    [Parameter(Mandatory = $true)]
    [string]$Target,
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $PSScriptRoot
$Target = (Resolve-Path -LiteralPath $Target).Path

function Copy-Template {
    param($RelSrc, $RelDest)
    $from = Join-Path $Root $RelSrc
    $to = Join-Path $Target $RelDest
    $dir = Split-Path $to
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    if ((Test-Path $to) -and -not $Force) {
        Write-Host "skip (exists): $RelDest"
        return
    }
    Copy-Item $from $to -Force
    Write-Host "wrote $RelDest"
}

Copy-Template "templates\DESIGN.md" "DESIGN.md"
Copy-Template "templates\tokens.tokens.json" "tokens\core.tokens.json"
Copy-Template "templates\.cursor\rules\ui-design.mdc" ".cursor\rules\ui-design.mdc"

Write-Host "Replace placeholder values in DESIGN.md. Do not ship the starter blues as a brand."
