# Create GitHub Repository Script
$token = "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"
$repoName = "ClimaLogic"
$description = "Industrial Emission Monitoring Platform - Monitor, Predict & Reduce Industrial Emissions in Real-Time"

$headers = @{
    "Authorization" = "token $token"
    "Accept" = "application/vnd.github.v3+json"
}

$body = @{
    name = $repoName
    description = $description
    private = $false
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $body -ContentType "application/json"
    Write-Host "✅ Repository created successfully!" -ForegroundColor Green
    Write-Host "Repository URL: $($response.html_url)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Now pushing code..." -ForegroundColor Yellow
    
    # Push code
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Code pushed successfully!" -ForegroundColor Green
        Write-Host "View your repository at: $($response.html_url)" -ForegroundColor Cyan
    }
} catch {
    Write-Host "❌ Error creating repository: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please create the repository manually:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
    Write-Host "2. Repository name: ClimaLogic" -ForegroundColor White
    Write-Host "3. Click 'Create repository'" -ForegroundColor White
    Write-Host "4. Then run: git push -u origin main" -ForegroundColor White
}

