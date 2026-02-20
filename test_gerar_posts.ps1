# Teste da API /api/gerar-posts com News API
Write-Host "🚀 Testando API /api/gerar-posts com News API..." -ForegroundColor Green

# Teste 1: Tecnologia (technology)
Write-Host "`n1. Testando Tecnologia (3 posts):" -ForegroundColor Cyan
try {
    $body = @{
        categoria = "technology"
        quantidade = 3
        pais = "br"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3001/api/gerar-posts" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts.Count) posts gerados" -ForegroundColor Green
    Write-Host "📊 Total disponível: $($response.total)" -ForegroundColor Yellow
    
    foreach ($post in $response.posts) {
        Write-Host "`n--- Post ---" -ForegroundColor Gray
        Write-Host "📰 Título: $($post.titulo)" -ForegroundColor White
        Write-Host "📝 Descrição: $($post.descricao -replace '`n', ' ')" -ForegroundColor Gray
        Write-Host "🔗 Link: $($post.url)" -ForegroundColor Blue
        Write-Host "📺 Fonte: $($post.fonte)" -ForegroundColor Magenta
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: Brasil (general)
Write-Host "`n2. Testando Brasil (2 posts):" -ForegroundColor Cyan
try {
    $body = @{
        categoria = "general"
        quantidade = 2
        pais = "br"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3001/api/gerar-posts" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts.Count) posts gerados" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Economia (business)
Write-Host "`n3. Testando Economia (1 post):" -ForegroundColor Cyan
try {
    $body = @{
        categoria = "business"
        quantidade = 1
        pais = "br"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3001/api/gerar-posts" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts.Count) posts gerados" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 4: Erro (categoria inválida)
Write-Host "`n4. Testando Erro (categoria inválida):" -ForegroundColor Yellow
try {
    $body = @{
        categoria = "invalida"
        quantidade = 3
        pais = "br"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3001/api/gerar-posts" -Method POST -Body $body -ContentType "application/json"
    Write-Host "❌ Deveria ter dado erro!" -ForegroundColor Red
} catch {
    Write-Host "✅ Erro esperado: $($_.Exception.Message)" -ForegroundColor Green
}

Write-Host "`n🎯 Teste concluído!" -ForegroundColor Green
Write-Host "A API agora usa News API real com notícias atualizadas!" -ForegroundColor Yellow
