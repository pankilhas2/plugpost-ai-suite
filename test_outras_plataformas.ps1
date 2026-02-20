# Testar postagem em outras plataformas

Write-Host "🌐 Testando outras plataformas..." -ForegroundColor Green

# 1. Testar Twitter/X (simulação)
Write-Host "`n🐦 Testando Twitter/X..." -ForegroundColor Yellow
try {
    $body = @{
        content = "🚀 Teste de postagem #newpostia #tecnologia"
        platform = "twitter"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/postar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Twitter: Post ID $($response.post_id)" -ForegroundColor Green
} catch {
    Write-Host "❌ Twitter: $($_.Exception.Message)" -ForegroundColor Red
}

# 2. Testar LinkedIn (simulação)
Write-Host "`n💼 Testando LinkedIn..." -ForegroundColor Yellow
try {
    $body = @{
        content = "🚀 Novo post sobre tecnologia #inovação #carreira"
        platform = "linkedin"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/postar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ LinkedIn: Post ID $($response.post_id)" -ForegroundColor Green
} catch {
    Write-Host "❌ LinkedIn: $($_.Exception.Message)" -ForegroundColor Red
}

# 3. Testar Instagram (simulação)
Write-Host "`n📷 Testando Instagram..." -ForegroundColor Yellow
try {
    $body = @{
        content = "🚀 Conteúdo incrível para Instagram #tecnologia #inovação"
        platform = "instagram"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/postar" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Instagram: Post ID $($response.post_id)" -ForegroundColor Green
} catch {
    Write-Host "❌ Instagram: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎉 Testes concluídos!" -ForegroundColor Green
Write-Host "💡 Todos os posts estão sendo processados e salvos no Supabase" -ForegroundColor Cyan
