# Debug de endpoints
Write-Host "Verificando endpoints disponíveis..." -ForegroundColor Green

# Testar endpoints conhecidos
$endpoints = @(
    "/api/gerar-posts",
    "/api/gerar", 
    "/api/ready-posts",
    "/api/health",
    "/api/test"
)

foreach ($endpoint in $endpoints) {
    try {
        $response = Invoke-RestMethod -Uri "http://localhost:3001$endpoint" -Method GET
        Write-Host "✅ $endpoint - $($response.message)" -ForegroundColor Green
    } catch {
        Write-Host "❌ $endpoint - $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Verificar porta do servidor
Write-Host "`nVerificando portas do servidor..." -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3001" -Method GET
    Write-Host "✅ Servidor rodando na porta 3001" -ForegroundColor Green
} catch {
    Write-Host "❌ Servidor não encontrado na porta 3001" -ForegroundColor Red
}

try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000" -Method GET
    Write-Host "✅ Servidor rodando na porta 3000" -ForegroundColor Green
} catch {
    Write-Host "❌ Servidor não encontrado na porta 3000" -ForegroundColor Red
}

try {
    $response = Invoke-RestMethod -Uri "http://localhost:3002" -Method GET
    Write-Host "✅ Servidor rodando na porta 3002" -ForegroundColor Green
} catch {
    Write-Host "❌ Servidor não encontrado na porta 3002" -ForegroundColor Red
}
