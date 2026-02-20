# Teste da News API gratuita - Corrigido para PowerShell
$apiKey = "f3a04b2b1ba84df08775a962e06f77b0"
$baseUrl = "https://newsapi.org/v2"

Write-Host "🔍 Testando News API..." -ForegroundColor Green

# Função helper para construir URLs com escape correto
function Build-Url {
    param($base, $params)
    $queryString = ""
    foreach ($param in $params.GetEnumerator()) {
        if ($queryString) { $queryString += "&" }
        $queryString += "$($param.Key)=$([System.Uri]::EscapeDataString($param.Value))"
    }
    return "$base?$queryString"
}

# Teste 1: Top headlines Brasil
Write-Host "`n1. Testando Top Headlines (Brasil):" -ForegroundColor Cyan
try {
    $url = Build-Url -base "$baseUrl/top-headlines" -params @{
        country = "br"
        apiKey = $apiKey
        pageSize = "3"
    }
    
    $response = Invoke-RestMethod -Uri $url -Method GET
    Write-Host "✅ Sucesso! $($response.articles.Count) notícias encontradas" -ForegroundColor Green
    
    foreach ($article in $response.articles) {
        Write-Host "`n📰 Título: $($article.title)" -ForegroundColor White
        Write-Host "🔗 Link: $($article.url)" -ForegroundColor Gray
        $desc = $article.description -replace "`n", " "
        Write-Host "📝 Descrição: $desc" -ForegroundColor Gray
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: Tecnologia
Write-Host "`n2. Testando Categoria Tecnologia:" -ForegroundColor Cyan
try {
    $url = Build-Url -base "$baseUrl/top-headlines" -params @{
        country = "br"
        category = "technology"
        apiKey = $apiKey
        pageSize = "2"
    }
    
    $response = Invoke-RestMethod -Uri $url -Method GET
    Write-Host "✅ Sucesso! $($response.articles.Count) notícias de tecnologia" -ForegroundColor Green
    
    foreach ($article in $response.articles) {
        Write-Host "`n💻 Título: $($article.title)" -ForegroundColor White
        Write-Host "🔗 Link: $($article.url)" -ForegroundColor Gray
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Negócios
Write-Host "`n3. Testando Categoria Negócios:" -ForegroundColor Cyan
try {
    $url = Build-Url -base "$baseUrl/top-headlines" -params @{
        country = "br"
        category = "business"
        apiKey = $apiKey
        pageSize = "2"
    }
    
    $response = Invoke-RestMethod -Uri $url -Method GET
    Write-Host "✅ Sucesso! $($response.articles.Count) notícias de negócios" -ForegroundColor Green
    
    foreach ($article in $response.articles) {
        Write-Host "`n💼 Título: $($article.title)" -ForegroundColor White
        Write-Host "🔗 Link: $($article.url)" -ForegroundColor Gray
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎯 Teste concluído!" -ForegroundColor Green
Write-Host "Se todos os testes passaram, a API está funcionando corretamente." -ForegroundColor Yellow
