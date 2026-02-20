# Teste da API gerar-posts corrigida
Write-Host "🚀 Testando API /api/gerar-posts..." -ForegroundColor Green

# Teste 1: Tecnologia
Write-Host "`n1. Testando Tecnologia (3 posts):" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar-posts" -Method POST -Body '{"tipo":"tecnologia","quantidade":3}' -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts_gerados) posts gerados" -ForegroundColor Green
    
    foreach ($post in $response.posts) {
        Write-Host "`n📱 Post: $($post.content -replace '`n', ' ')" -ForegroundColor White
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: Brasil
Write-Host "`n2. Testando Brasil (2 posts):" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar-posts" -Method POST -Body '{"tipo":"brasil","quantidade":2}' -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts_gerados) posts gerados" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Economia
Write-Host "`n3. Testando Economia (1 post):" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar-posts" -Method POST -Body '{"tipo":"economia","quantidade":1}' -ContentType "application/json"
    Write-Host "✅ Sucesso! $($response.posts_gerados) posts gerados" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 4: Erro (categoria inválida)
Write-Host "`n4. Testando Erro (categoria inválida):" -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar-posts" -Method POST -Body '{"tipo":"invalida","quantidade":3}' -ContentType "application/json"
    Write-Host "❌ Deveria ter dado erro!" -ForegroundColor Red
} catch {
    Write-Host "✅ Erro esperado: $($_.Exception.Message)" -ForegroundColor Green
}

Write-Host "`n🎯 Teste concluído!" -ForegroundColor Green
