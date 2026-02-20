# Teste da IA Studio Edge Function - Versão Final Corrigida
Write-Host "🎨 Testando IA Studio Enhanced..." -ForegroundColor Green

# Sem autenticação para testar se a função permite acesso público
$baseUrl = "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/ia-studio-generate"

$headers = @{
    'Content-Type' = 'application/json'
    'user-id' = 'test-user-123'
}

# Teste 1: Health Check (se existir)
Write-Host "`n1. Testando Health Check:" -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "$baseUrl/health" -Method GET -Headers $headers -ErrorAction Stop
    Write-Host "✅ Health OK: $($response.status)" -ForegroundColor Green
} catch {
    Write-Host "ℹ️ Health endpoint não disponível" -ForegroundColor Yellow
}

# Teste 2: Post Perfeito
Write-Host "`n2. Testando Post Perfeito:" -ForegroundColor Cyan
try {
    $body = @{
        tool = "post-perfeito"
        inputs = @{
            rede = "instagram"
            tema = "marketing digital para iniciantes"
            tom = "educativo"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -Headers $headers -ErrorAction Stop
    Write-Host "✅ Sucesso!" -ForegroundColor Green
    Write-Host "📝 Titulo: $($response.result.titulo)" -ForegroundColor White
    $hashtags = $response.result.hashtags -join ', '
    Write-Host "📊 Hashtags: $hashtags" -ForegroundColor Yellow
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.Exception.Response) {
        Write-Host "Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Gray
        Write-Host "Resposta: $($_.Exception.Response | ConvertTo-Json)" -ForegroundColor Gray
    }
}

# Teste 3: Com autenticação (alternativa)
Write-Host "`n3. Testando com Bearer Token:" -ForegroundColor Cyan
try {
    $anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzQ3OTM3NDc3LCJleHAiOjIwNjM1MTM0NDczN30.SOeBiP4a64kDCDPctXbs34TJ2lox7sZrq0T0l-ZuSyo"
    
    $headersAuth = @{
        'Authorization' = "Bearer $anonKey"
        'Content-Type' = 'application/json'
        'user-id' = 'test-user-123'
    }
    
    $body = @{
        tool = "gerador-ideias"
        inputs = @{
            quantidade = 3
            formato = "posts"
            nicho = "tecnologia"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -Headers $headersAuth -ErrorAction Stop
    Write-Host "✅ Sucesso com autenticação!" -ForegroundColor Green
    Write-Host "💡 Ideias: $($response.result.Count)" -ForegroundColor White
    Write-Host "🎯 Primeira ideia: $($response.result[0].ideia)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro com auth: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.Exception.Response) {
        Write-Host "Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Gray
    }
}

Write-Host "`n🎯 Testes concluídos!" -ForegroundColor Green
Write-Host "📊 Verifique os logs no dashboard Supabase" -ForegroundColor Yellow
Write-Host "🔧 Se ainda der 401, a função precisa de config.toml com verify_jwt = false" -ForegroundColor Cyan
