# Diagnostico completo das Edge Functions
Write-Host "=== DIAGNOSTICO COMPLETO ===" -ForegroundColor Yellow

$baseUrl = "https://ykswhzqdjoshjoaruhqs.supabase.co/functions/v1"

Write-Host "`n1. Testando bright-action:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/bright-action" -Method POST -Body '{"name":"Test"}' -ContentType "application/json" -ErrorAction Stop
    Write-Host "✅ bright-action: SUCESSO" -ForegroundColor Green
    Write-Host "Resposta: $($response.message)" -ForegroundColor White
} catch {
    Write-Host "❌ bright-action: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n2. Testando clever-service:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/clever-service" -Method GET -ErrorAction Stop
    Write-Host "✅ clever-service: SUCESSO" -ForegroundColor Green
    Write-Host "Status: $($response.status)" -ForegroundColor White
} catch {
    Write-Host "❌ clever-service: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n3. Testando ia-studio-generate:" -ForegroundColor Cyan
try {
    $body = @{
        tool = "post-perfeito"
        inputs = @{
            rede = "instagram"
            tema = "marketing digital"
            tom = "educativo"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri "$baseUrl/ia-studio-generate" -Method POST -Body $body -ContentType "application/json" -ErrorAction Stop
    Write-Host "✅ ia-studio-generate: SUCESSO" -ForegroundColor Green
    Write-Host "Titulo gerado: $($response.titulo)" -ForegroundColor White
} catch {
    Write-Host "❌ ia-studio-generate: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n=== DIAGNOSTICO CONCLUIDO ===" -ForegroundColor Yellow
Write-Host "Se todas as funcoes retornarem 401, os config.toml nao estao aplicados!" -ForegroundColor Red
Write-Host "Se alguma retornar 404, a funcao nao existe!" -ForegroundColor Red
