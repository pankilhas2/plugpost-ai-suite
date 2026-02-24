# Teste direto da News API
Write-Host "🔍 Testando News API diretamente..." -ForegroundColor Green

$apiKey = "f3a04b2b1ba84df08775a962e06f77b0"
$url = "https://newsapi.org/v2/top-headlines?country=br&category=technology&apiKey=$apiKey&pageSize=3"

Write-Host "URL: $url" -ForegroundColor Cyan

try {
    $response = Invoke-RestMethod -Uri $url -Method GET
    Write-Host "✅ News API funcionou!" -ForegroundColor Green
    Write-Host "Status: $($response.status)" -ForegroundColor White
    Write-Host "Total Results: $($response.totalResults)" -ForegroundColor Yellow
    Write-Host "Articles Count: $($response.articles.Count)" -ForegroundColor Yellow
    
    if ($response.articles.Count -gt 0) {
        Write-Host "`n📰 Primeiro artigo:" -ForegroundColor Cyan
        $article = $response.articles[0]
        Write-Host "Título: $($article.title)" -ForegroundColor White
        Write-Host "Descrição: $($article.description)" -ForegroundColor Gray
        Write-Host "URL: $($article.url)" -ForegroundColor Blue
    }
    
} catch {
    Write-Host "❌ Erro na News API:" -ForegroundColor Red
    Write-Host "Message: $($_.Exception.Message)" -ForegroundColor Red
    
    if ($_.Exception.Response) {
        Write-Host "Status Code: $($_.Exception.Response.StatusCode)" -ForegroundColor Yellow
        try {
            $errorBody = $_.Exception.Response.GetResponseStream()
            $reader = New-Object System.IO.StreamReader($errorBody)
            $errorText = $reader.ReadToEnd()
            Write-Host "Error Body: $errorText" -ForegroundColor Gray
        } catch {
            Write-Host "Não foi possível ler o corpo do erro" -ForegroundColor Gray
        }
    }
}
