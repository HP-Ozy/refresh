# Installa la skill "refresh" per Claude Code (Windows)
# Uso: aprire PowerShell nella cartella del progetto e lanciare:  .\install.ps1

$ErrorActionPreference = "Stop"
$src  = $PSScriptRoot
$dest = Join-Path $env:USERPROFILE ".claude\skills\refresh"

Write-Host "Installazione skill 'refresh'..." -ForegroundColor Cyan

if (-not (Test-Path (Join-Path $src "SKILL.md"))) {
    Write-Host "ERRORE: SKILL.md non trovato. Lancia lo script dalla cartella del progetto." -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item (Join-Path $src "SKILL.md")  -Destination $dest -Force
Copy-Item (Join-Path $src "README.md") -Destination $dest -Force
if (Test-Path (Join-Path $src "evals")) {
    Copy-Item (Join-Path $src "evals") -Destination $dest -Recurse -Force
}

Write-Host "Fatto. Skill installata in:" -ForegroundColor Green
Write-Host "  $dest"
Write-Host "Apri (o riavvia) Claude Code e scrivi /refresh"
