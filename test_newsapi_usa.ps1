# Teste News API com USA
Write-Host "Testing News API with USA..." -ForegroundColor Green

$apiKey = "f3a04b2b1ba84df08775a962e06f77b0"
$baseUrl = "https://newsapi.org/v2/top-headlines"
$params = @{
    country = "us"
    category = "technology"
    apiKey = $apiKey
    pageSize = 3
}

try {
    $response = Invoke-RestMethod -Uri $baseUrl -Method GET -Body $params
    Write-Host "News API OK!" -ForegroundColor Green
    Write-Host "Status: $($response.status)" -ForegroundColor White
    Write-Host "Total: $($response.totalResults)" -ForegroundColor Yellow
    Write-Host "Articles: $($response.articles.Count)" -ForegroundColor Yellow
    
    if ($response.articles.Count -gt 0) {
        Write-Host "First article: $($response.articles[0].title)" -ForegroundColor Cyan
    }
    
} catch {
    Write-Host "News API Error:" -ForegroundColor Red
    Write-Host "Message: $($_.Exception.Message)" -ForegroundColor Red
    
    if ($_.Exception.Response) {
        Write-Host "Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Yellow
    }
}
