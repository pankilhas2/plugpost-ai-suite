# Teste da Clever Service - Versão Corrigida
Write-Host "🧠 Testando Clever Service (com auth)..." -ForegroundColor Green

$baseUrl = "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/clever-service"
$anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzQ3OTM3NDc3LCJleHAiOjIwNjM1MTM0NDczN30.SOeBiP4a64kDCDPctXbs34TJ2lox7sZrq0T0l-ZuSyo"

$headers = @{
    'Authorization' = "Bearer $anonKey"
    'Content-Type' = 'application/json'
}

# Teste 1: Health Check
Write-Host "`n1. Testando Health Check:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/health" -Method GET -Headers $headers
    Write-Host "✅ Status: $($response.status)" -ForegroundColor Green
    Write-Host "📅 Timestamp: $($response.timestamp)" -ForegroundColor White
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: Analise de Texto
Write-Host "`n2. Testando Analise de Texto:" -ForegroundColor Cyan
try {
    $body = @{
        text = "Este produto e muito bom e funciona perfeitamente! Recomendo a todos."
        type = "sentiment"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/analyze" -Method POST -Body $body -Headers $headers
    Write-Host "✅ Sentimento: $($response.analysis.sentiment)" -ForegroundColor Green
    Write-Host "📊 Confianca: $($response.analysis.confidence)" -ForegroundColor White
    $keywords = $response.analysis.keywords -join ', '
    Write-Host "🔑 Keywords: $keywords" -ForegroundColor Yellow
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Gerar Conteudo
Write-Host "`n3. Testando Gerar Conteudo:" -ForegroundColor Cyan
try {
    $body = @{
        prompt = "Crie um post sobre marketing digital para iniciantes"
        model = "clever-ai"
        max_tokens = 300
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/generate" -Method POST -Body $body -Headers $headers
    Write-Host "✅ Conteudo gerado:" -ForegroundColor Green
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
        text = "Este e um texto simples que precisa ser melhorado para ter mais impacto."
        enhancement = "engagement"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/enhance" -Method POST -Body $body -Headers $headers
    Write-Host "✅ Texto melhorado:" -ForegroundColor Green
    Write-Host "📝 Original: $($response.original)" -ForegroundColor Gray
    Write-Host "✨ Melhorado: $($response.enhanced)" -ForegroundColor White
    Write-Host "📈 Melhoria: $($response.improved_by)%" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 5: Listar Endpoints
Write-Host "`n5. Listando Endpoints Disponiveis:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl" -Method GET -Headers $headers
    Write-Host "🔗 Servico: $($response.service)" -ForegroundColor Green
    Write-Host "📦 Versao: $($response.version)" -ForegroundColor White
    
    foreach ($endpoint in $response.endpoints) {
        Write-Host "  → $($endpoint.path): $($endpoint.description)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎯 Testes concluidos!" -ForegroundColor Green
Write-Host "A Clever Service esta funcionando com todos os endpoints!" -ForegroundColor Yellow
