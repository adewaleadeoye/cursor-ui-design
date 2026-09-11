# Copy the ui-design skill into the current user's Cursor skills folder.
# Usage: pwsh -File scripts/install-skill.ps1 [-WithUserRule]

param(
    [switch]$WithUserRule
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $PSScriptRoot
$Src = Join-Path $Root "skills\ui-design"
$Dest = Join-Path $HOME ".cursor\skills\ui-design"

if (-not (Test-Path $Src)) {
    throw "Skill not found at $Src"
}

New-Item -ItemType Directory -Force -Path (Split-Path $Dest) | Out-Null
if (Test-Path $Dest) {
    Remove-Item -Recurse -Force $Dest
}
Copy-Item -Recurse $Src $Dest
Write-Host "Installed skill -> $Dest"

if ($WithUserRule) {
    $RuleDir = Join-Path $HOME ".cursor\rules"
    New-Item -ItemType Directory -Force -Path $RuleDir | Out-Null
    $RuleSrc = Join-Path $Root "templates\user-rule.mdc"
    Copy-Item $RuleSrc (Join-Path $RuleDir "ui-design.mdc") -Force
    Write-Host "Installed user rule -> $RuleDir\ui-design.mdc"
}
