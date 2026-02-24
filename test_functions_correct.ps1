# Teste das Edge Functions - Projeto Correto
Write-Host "Testando Edge Functions..." -ForegroundColor Green

$baseUrl = "https://ykswhzqdjoshjoaruhqs.supabase.co/functions/v1"

# Teste 1: bright-action
Write-Host "`n1. Testando bright-action:" -ForegroundColor Cyan
try {
    $body = @{
        name = "Functions"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "$baseUrl/bright-action" -Method POST -Body $body -ContentType "application/json" -ErrorAction Stop
    Write-Host "Sucesso: $($response.message)" -ForegroundColor Green
} catch {
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 2: clever-service
Write-Host "`n2. Testando clever-service:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/clever-service" -Method GET -ErrorAction Stop
    Write-Host "Sucesso: $($response.status)" -ForegroundColor Green
} catch {
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: ia-studio-generate
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
    Write-Host "Sucesso: Titulo gerado" -ForegroundColor Green
} catch {
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nTestes concluidos!" -ForegroundColor Green
