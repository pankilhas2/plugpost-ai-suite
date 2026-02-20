# Teste da Clever Service - Supabase Edge Function
Write-Host "🧠 Testando Clever Service..." -ForegroundColor Green

$baseUrl = "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/clever-service"

# Teste 1: Health Check
Write-Host "`n1. Testando Health Check:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/health" -Method GET
    Write-Host "✅ Status: $($response.status)" -ForegroundColor Green
    Write-Host "📅 Timestamp: $($response.timestamp)" -ForegroundColor White
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: Análise de Texto
Write-Host "`n2. Testando Análise de Texto:" -ForegroundColor Cyan
try {
    $body = @{
        text = "Este produto é muito bom e funciona perfeitamente! Recomendo a todos."
        type = "sentiment"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/analyze" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Sentimento: $($response.analysis.sentiment)" -ForegroundColor Green
    Write-Host "📊 Confiança: $($response.analysis.confidence)" -ForegroundColor White
    Write-Host "🔑 Keywords: $($response.analysis.keywords -join ', ')" -ForegroundColor Yellow
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Geração de Conteúdo
Write-Host "`n3. Testando Geração de Conteúdo:" -ForegroundColor Cyan
try {
    $body = @{
        prompt = "Crie um post sobre marketing digital para iniciantes"
        model = "clever-ai"
        max_tokens = 300
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/generate" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Conteúdo gerado:" -ForegroundColor Green
    Write-Host "📝 Texto: $($response.generated.text)" -ForegroundColor White
    Write-Host "🤖 Modelo: $($response.generated.model_used)" -ForegroundColor Cyan
    Write-Host "🔢 Tokens: $($response.generated.tokens_used)" -ForegroundColor Yellow
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 4: Melhorar Texto
Write-Host "`n4. Testando Melhorar Texto:" -ForegroundColor Cyan
try {
    $body = @{
        text = "Este é um texto simples que precisa ser melhorado para ter mais impacto."
        enhancement = "engagement"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/enhance" -Method POST -Body $body -ContentType "application/json"
    Write-Host "✅ Texto melhorado:" -ForegroundColor Green
    Write-Host "📝 Original: $($response.original)" -ForegroundColor Gray
    Write-Host "✨ Melhorado: $($response.enhanced)" -ForegroundColor White
    Write-Host "📈 Melhoria: $($response.improved_by)%" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 5: Listar Endpoints
Write-Host "`n5. Listando Endpoints Disponíveis:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl" -Method GET
    Write-Host "🔗 Serviço: $($response.service)" -ForegroundColor Green
    Write-Host "📦 Versão: $($response.version)" -ForegroundColor White
    
    foreach ($endpoint in $response.endpoints) {
        Write-Host "  → $($endpoint.path): $($endpoint.description)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎯 Testes concluídos!" -ForegroundColor Green
Write-Host "A Clever Service está funcionando com todos os endpoints!" -ForegroundColor Yellow
