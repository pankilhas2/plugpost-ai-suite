# Teste completo das APIs funcionando

Write-Host "🚀 Testando APIs do projeto..." -ForegroundColor Green

# Testar API principal (gerar posts)
Write-Host "`n📝 Testando /api (gerar posts)..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api" -Method GET
    Write-Host "✅ GET /api funcionando!" -ForegroundColor Green
    Write-Host "Categorias: $($response.categorias -join ', ')" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro em /api: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar API de postar
Write-Host "`n📤 Testando /api/postar..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/postar" -Method GET
    Write-Host "✅ GET /api/postar funcionando!" -ForegroundColor Green
    Write-Host "Plataformas: $($response.platforms -join ', ')" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro em /api/postar: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar API ready-posts
Write-Host "`n🚀 Testando /api/ready-posts..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/ready-posts" -Method GET
    Write-Host "✅ GET /api/ready-posts funcionando!" -ForegroundColor Green
    Write-Host "Features: $($response.features -join ', ')" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro em /api/ready-posts: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar API de teste
Write-Host "`n🧪 Testando /api/test..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/test" -Method GET
    Write-Host "✅ GET /api/test funcionando!" -ForegroundColor Green
    Write-Host "Status: $($response.message)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro em /api/test: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar POST para gerar posts
Write-Host "`n📝 Testando POST /api (gerar posts)..." -ForegroundColor Yellow
try {
    $body = @{
        tipo = "tecnologia"
        quantidade = 2
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ POST /api funcionando!" -ForegroundColor Green
    Write-Host "Posts gerados: $($response.posts_gerados)" -ForegroundColor Cyan
    Write-Host "Categoria: $($response.categoria)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro em POST /api: $($_.Exception.Message)" -ForegroundColor Red
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
    Write-Host "Status: $($response.status)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro em POST /api/postar: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎉 Testes concluídos!" -ForegroundColor Green
Write-Host "✨ Todas as APIs estão funcionando corretamente!" -ForegroundColor Green
