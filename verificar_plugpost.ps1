# Verificar se posts foram publicados na PlugPost-AI

Write-Host "🔍 Verificando posts na PlugPost-AI..." -ForegroundColor Green

# Tentar acessar a página e verificar posts
try {
    $response = Invoke-WebRequest -Uri "https://plugpost-ai.lovable.app/" -Method GET -UseBasicParsing
    $content = $response.Content
    
    Write-Host "✅ Página acessada com sucesso!" -ForegroundColor Green
    
    # Procurar por indicadores de posts recentes
    if ($content -match "post") {
        Write-Host "📝 Posts encontrados na página" -ForegroundColor Cyan
    } else {
        Write-Host "⚠️ Nenhum post detectado automaticamente" -ForegroundColor Yellow
    }
    
    # Salvar conteúdo para análise manual
    $content | Out-File -FilePath "plugpost_page.html" -Encoding UTF8
    Write-Host "📄 Página salva como 'plugpost_page.html' para verificação manual" -ForegroundColor Cyan
    
} catch {
    Write-Host "❌ Erro ao acessar PlugPost-AI: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n💡 Verifique manualmente em: https://plugpost-ai.lovable.app/" -ForegroundColor Yellow
Write-Host "📱 Use as credenciais: midiadigital26@gmail.com" -ForegroundColor Cyan
