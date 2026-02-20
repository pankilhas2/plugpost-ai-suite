# Como testar as APIs individualmente

Write-Host "🧪 TESTE DAS APIs" -ForegroundColor Green
Write-Host "==================" -ForegroundColor Green

# 1. Testar API de gerar posts (GET)
Write-Host "`n1️⃣ GET /api - Verificar status" -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api" -Method GET
    Write-Host "✅ Funcionando!" -ForegroundColor Green
    Write-Host "Categorias: $($response.categorias -join ', ')" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# 2. Testar gerar posts (POST)
Write-Host "`n2️⃣ POST /api - Gerar posts" -ForegroundColor Yellow
try {
    $body = @{
        tipo = "tecnologia"
        quantidade = 2
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Posts gerados: $($response.posts_gerados)" -ForegroundColor Green
    Write-Host "Categoria: $($response.categoria)" -ForegroundColor Cyan
    
    # Mostrar primeiro post
    if ($response.posts.Count -gt 0) {
        Write-Host "Primeiro post:" -ForegroundColor White
        Write-Host $response.posts[0].content -ForegroundColor Gray
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# 3. Testar API de postar (GET)
Write-Host "`n3️⃣ GET /api/postar - Verificar plataformas" -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/postar" -Method GET
    Write-Host "✅ Funcionando!" -ForegroundColor Green
    Write-Host "Plataformas: $($response.platforms -join ', ')" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# 4. Testar postar conteúdo (POST)
Write-Host "`n4️⃣ POST /api/postar - Publicar conteúdo" -ForegroundColor Yellow
try {
    $body = @{
        content = "🚀 Teste de postagem automática #newpostia #teste"
        platform = "plugpost"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/postar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Post publicado!" -ForegroundColor Green
    Write-Host "Post ID: $($response.post_id)" -ForegroundColor Cyan
    Write-Host "Status: $($response.status)" -ForegroundColor Cyan
    Write-Host "Plataforma: $($response.platform)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# 5. Testar ready-posts com IA (GET)
Write-Host "`n5️⃣ GET /api/ready-posts - Verificar IA" -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/ready-posts" -Method GET
    Write-Host "✅ Funcionando!" -ForegroundColor Green
    Write-Host "Features: $($response.features -join ', ')" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎉 TESTES CONCLUÍDOS!" -ForegroundColor Green
Write-Host "==================" -ForegroundColor Green
