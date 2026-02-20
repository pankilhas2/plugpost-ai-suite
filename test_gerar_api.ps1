# Teste da API /api/gerar com News API
Write-Host "🚀 Testando API /api/gerar com News API..." -ForegroundColor Green

# Teste 1: Tecnologia
Write-Host "`n1. Testando Tecnologia (3 posts):" -ForegroundColor Cyan
try {
    $body = @{
        tipo = "tecnologia"
        quantidade = 3
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts_gerados) posts gerados" -ForegroundColor Green
    Write-Host "📰 Categoria: $($response.categoria)" -ForegroundColor White
    
    foreach ($post in $response.posts) {
        Write-Host "`n--- Post ---" -ForegroundColor Gray
        Write-Host $post.content -ForegroundColor White
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: Brasil
Write-Host "`n2. Testando Brasil (2 posts):" -ForegroundColor Cyan
try {
    $body = @{
        tipo = "brasil"
        quantidade = 2
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts_gerados) posts gerados" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Economia
Write-Host "`n3. Testando Economia (1 post):" -ForegroundColor Cyan
try {
    $body = @{
        tipo = "economia"
        quantidade = 1
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts_gerados) posts gerados" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 4: Erro (categoria inválida)
Write-Host "`n4. Testando Erro (categoria inválida):" -ForegroundColor Yellow
try {
    $body = @{
        tipo = "invalida"
        quantidade = 3
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "❌ Deveria ter dado erro!" -ForegroundColor Red
} catch {
    Write-Host "✅ Erro esperado: $($_.Exception.Message)" -ForegroundColor Green
}

# Teste 5: GET para verificar status
Write-Host "`n5. Testando GET (status):" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar" -Method GET
    Write-Host "✅ Status: $($response.message)" -ForegroundColor Green
    Write-Host "📋 Categorias disponíveis: $($response.categorias -join ', ')" -ForegroundColor White
} catch {
    Write-Host "❌ Erro GET: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎯 Teste concluído!" -ForegroundColor Green
Write-Host "A API agora usa News API real com fallback automático!" -ForegroundColor Yellow
