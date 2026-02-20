# Testar geração e postagem automática na NewPost-IA

Write-Host "🚀 Testando Auto-Post na NewPost-IA..." -ForegroundColor Green

# Testar sem auto-post (apenas gerar)
Write-Host "`n1️⃣ Gerar posts SEM auto-post..." -ForegroundColor Yellow
try {
    $body = @{
        category = "tecnologia"
        count = 2
        auto_post = $false
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/ready-posts" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Posts gerados: $($response.posts_generated)" -ForegroundColor Green
    Write-Host "Auto-post: $($response.auto_post_enabled)" -ForegroundColor Cyan
    Write-Host "Mensagem: $($response.message)" -ForegroundColor White
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Testar com auto-post (gerar e publicar)
Write-Host "`n2️⃣ Gerar posts COM auto-post..." -ForegroundColor Yellow
try {
    $body = @{
        category = "tecnologia"
        count = 2
        auto_post = $true
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/ready-posts" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Posts gerados: $($response.posts_generated)" -ForegroundColor Green
    Write-Host "Posts publicados: $($response.successful_posts)" -ForegroundColor Green
    Write-Host "Auto-post: $($response.auto_post_enabled)" -ForegroundColor Cyan
    Write-Host "Mensagem: $($response.message)" -ForegroundColor White
    
    # Mostrar resultados das postagens
    if ($response.posted_results) {
        Write-Host "`n📤 Resultados das postagens:" -ForegroundColor Yellow
        foreach ($result in $response.posted_results) {
            Write-Host "Status: $($result.result.success)" -ForegroundColor $(if($result.result.success) {"Green"} else {"Red"})
            Write-Host "Post ID: $($result.result.post_id)" -ForegroundColor Cyan
            Write-Host "Conteúdo: $($result.content.Substring(0, 80))..." -ForegroundColor Gray
            Write-Host "---" -ForegroundColor Gray
        }
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎉 Testes concluídos!" -ForegroundColor Green
Write-Host "💡 Para postar automaticamente, use auto_post=true no request" -ForegroundColor Cyan
