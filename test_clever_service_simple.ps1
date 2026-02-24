# Teste da Clever Service Edge Function - Versao Simples
Write-Host "Testando Clever Service..." -ForegroundColor Green

$baseUrl = "https://jwvbgimapyyenencrhof.supabase.co/functions/v1/clever-service"

# Teste 1: Health Check
Write-Host "`n1. Testando Health Check:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/health" -Method GET -ErrorAction Stop
    Write-Host "Health OK: $($response.status)" -ForegroundColor Green
} catch {
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: Text Analysis
Write-Host "`n2. Testando Text Analysis:" -ForegroundColor Cyan
try {
    $body = @{
        text = "Este é um texto de teste para análise"
        type = "keywords"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/analyze" -Method POST -Body $body -ContentType "application/json" -ErrorAction Stop
    Write-Host "Analise concluida!" -ForegroundColor Green
    Write-Host "Palavras-chave: $($response.keywords.Count)" -ForegroundColor White
} catch {
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Content Generation
Write-Host "`n3. Testando Content Generation:" -ForegroundColor Cyan
try {
    $body = @{
        prompt = "Crie um post sobre tecnologia"
        length = "short"
        tone = "professional"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/generate" -Method POST -Body $body -ContentType "application/json" -ErrorAction Stop
    Write-Host "Conteudo gerado!" -ForegroundColor Green
    
    if ($response.content) {
        $preview = $response.content.Substring(0, [Math]::Min(50, $response.content.Length))
        Write-Host "Preview: $preview..." -ForegroundColor White
    }
} catch {
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nTestes concluidos!" -ForegroundColor Green
Write-Host "Verifique os logs no dashboard Supabase" -ForegroundColor Yellow
