# Teste da Edge Function bright-action
Write-Host "🌟 Testando bright-action..." -ForegroundColor Green

$baseUrl = "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/bright-action"

try {
    $body = @{
        name = "Functions"
    } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -ContentType "application/json" -ErrorAction Stop
    Write-Host "✅ Sucesso!" -ForegroundColor Green
    Write-Host "📝 Mensagem: $($response.message)" -ForegroundColor White
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.Exception.Response) {
        Write-Host "Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Gray
    }
}

Write-Host "`n🎯 Teste concluído!" -ForegroundColor Green
