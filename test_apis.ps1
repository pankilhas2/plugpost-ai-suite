# Teste das APIs do projeto

Write-Host "🧪 Testando APIs do projeto..." -ForegroundColor Green

# Testar API de gerar posts
Write-Host "`n📝 Testando /api/gerar..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/gerar" -Method GET
    Write-Host "✅ GET /api/gerar funcionando!" -ForegroundColor Green
    Write-Host $response | ConvertTo-Json -Depth 3
} catch {
    Write-Host "❌ Erro em /api/gerar: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar API de postar
Write-Host "`n📤 Testando /api/postar..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/postar" -Method GET
    Write-Host "✅ GET /api/postar funcionando!" -ForegroundColor Green
    Write-Host $response | ConvertTo-Json -Depth 3
} catch {
    Write-Host "❌ Erro em /api/postar: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar API ready-posts
Write-Host "`n🚀 Testando /api/ready-posts..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/ready-posts" -Method GET
    Write-Host "✅ GET /api/ready-posts funcionando!" -ForegroundColor Green
    Write-Host $response | ConvertTo-Json -Depth 3
} catch {
    Write-Host "❌ Erro em /api/ready-posts: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar POST para gerar posts
Write-Host "`n📝 Testando POST /api/gerar..." -ForegroundColor Yellow
try {
    $body = @{
        tipo = "tecnologia"
        quantidade = 2
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/gerar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ POST /api/gerar funcionando!" -ForegroundColor Green
    Write-Host "Posts gerados: $($response.posts_gerados)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro em POST /api/gerar: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar POST para postar
Write-Host "`n📤 Testando POST /api/postar..." -ForegroundColor Yellow
try {
    $body = @{
        content = "🚀 Teste de postagem automática #newpostia #teste"
        platform = "plugpost"
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/postar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ POST /api/postar funcionando!" -ForegroundColor Green
    Write-Host "Post ID: $($response.post_id)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro em POST /api/postar: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎉 Testes concluídos!" -ForegroundColor Green
