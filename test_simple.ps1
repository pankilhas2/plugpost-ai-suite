# Teste simples da API
Write-Host "🧪 Testando API simples..." -ForegroundColor Green

# Teste 1: GET
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/test" -Method GET
    Write-Host "✅ GET /api/test: $($response.message)" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro GET: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: POST
try {
    $body = @{
        tipo = "tecnologia"
        quantidade = 2
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/test" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ POST /api/test: $($response.message)" -ForegroundColor Green
    Write-Host "📱 Posts: $($response.posts.Count)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro POST: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Verificar se gerar-posts existe
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3002/api/gerar-posts" -Method GET
    Write-Host "✅ GET /api/gerar-posts: Funciona!" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro GET /api/gerar-posts: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎯 Teste concluído!" -ForegroundColor Green
