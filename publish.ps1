# Rebuilds the quiz and pushes the new pages to GitHub Pages.
# Run from anywhere:  powershell -File "C:\Users\premanandh\Claude Code\nwtg-site\publish.ps1"
$site = $PSScriptRoot
$src = Join-Path (Split-Path $site -Parent) "nation-wants-to-guess-v2"
Push-Location $src
python server.py --build
Pop-Location
Copy-Item (Join-Path $src "player.html") (Join-Path $site "index.html") -Force
Copy-Item (Join-Path $src "quiz.html") (Join-Path $site "quiz.html") -Force
Push-Location $site
git add -A
git commit -m "Update quiz pages"
git push
Pop-Location
Write-Host "Published. Pages refresh in about a minute: https://anandcodie.github.io/nation-wants-to-guess/"
