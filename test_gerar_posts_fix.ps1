# Teste da API /api/gerar-posts - VERSÃO CORRIGIDA
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
        Write-Host "📝 Descrição: $($post.descricao)" -ForegroundColor Gray
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

# Teste 4: Verificar endpoints disponíveis
Write-Host "`n4. Verificando endpoints:" -ForegroundColor Yellow
try {
    $endpoints = @(
        "/api/gerar-posts",
        "/api/ready-posts", 
        "/api/latest-news",
        "/api/health"
    )
    
    foreach ($endpoint in $endpoints) {
        try {
            $response = Invoke-RestMethod -Uri "http://localhost:3001$endpoint" -Method GET
            Write-Host "✅ $endpoint - OK" -ForegroundColor Green
        } catch {
            Write-Host "❌ $endpoint - Erro: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
} catch {
    Write-Host "❌ Erro ao verificar endpoints: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎯 Teste concluído!" -ForegroundColor Green
Write-Host "Use este script para testar a API com News API real!" -ForegroundColor Yellow
