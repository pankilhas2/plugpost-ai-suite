# Teste simples da API para debug
Write-Host "🚀 Testando API /api/gerar-posts..." -ForegroundColor Green

try {
    $body = @{
        categoria = "technology"
        quantidade = 3
    } | ConvertTo-Json
    
    Write-Host "Enviando requisição POST para http://localhost:3000/api/gerar-posts" -ForegroundColor Cyan
    Write-Host "Body: $body" -ForegroundColor Yellow
    
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/gerar-posts" -Method POST -Body $body -ContentType "application/json"
    
    Write-Host "✅ Sucesso!" -ForegroundColor Green
    Write-Host "Response:" -ForegroundColor White
    $response | ConvertTo-Json -Depth 10
    
} catch {
    Write-Host "❌ Erro:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host "Status Code: $($_.Exception.Response.StatusCode)" -ForegroundColor Yellow
    Write-Host "Response: $($_.Exception.Response.GetResponseStream())" -ForegroundColor Gray
}
