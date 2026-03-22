param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("on","off")]
    [string]$mode
)

$repoPath = "C:\Users\djlia\Documents\Web-Portfolio"
cd $repoPath

if ($mode -eq "on") {
    Write-Host "Maintenance mode ON..."
    Copy-Item "maintenance.html" "index.html" -Force
    vercel --prod
    Write-Host "Done: maintenance enabled"
}

if ($mode -eq "off") {
    Write-Host "Maintenance mode OFF..."
    Copy-Item "index.backup.html" "index.html" -Force
    vercel --prod
    Write-Host "Done: site restored"
}