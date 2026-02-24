# Teste simples da News API
Write-Host "🔍 Testando News API..." -ForegroundColor Green

$apiKey = "f3a04b2b1ba84df08775a962e06f77b0"
$baseUrl = "https://newsapi.org/v2/top-headlines"
$params = @{
    country = "br"
    category = "technology"
    apiKey = $apiKey
    pageSize = 3
}

try {
    $response = Invoke-RestMethod -Uri $baseUrl -Method GET -Body $params
    Write-Host "✅ News API funcionou!" -ForegroundColor Green
    Write-Host "Status: $($response.status)" -ForegroundColor White
    Write-Host "Total Results: $($response.totalResults)" -ForegroundColor Yellow
    Write-Host "Articles Count: $($response.articles.Count)" -ForegroundColor Yellow
    
} catch {
    Write-Host "❌ Erro na News API:" -ForegroundColor Red
    Write-Host "Message: $($_.Exception.Message)" -ForegroundColor Red
    
    if ($_.Exception.Response) {
        Write-Host "Status Code: $($_.Exception.Response.StatusCode)" -ForegroundColor Yellow
    }
}
