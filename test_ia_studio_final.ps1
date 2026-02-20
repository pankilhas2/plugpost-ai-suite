# Teste da IA Studio Edge Function - Versão Final
Write-Host "🎨 Testando IA Studio Enhanced..." -ForegroundColor Green

$baseUrl = "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/ia-studio-generate"

# Teste 1: Post Perfeito (sem auth)
Write-Host "`n1. Testando Post Perfeito:" -ForegroundColor Cyan
try {
    $body = @{
        tool = "post-perfeito"
        inputs = @{
            rede = "instagram"
            tema = "marketing digital para iniciantes"
            tom = "educativo"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -ContentType "application/json" -ErrorAction Stop
    Write-Host "✅ Sucesso!" -ForegroundColor Green
    Write-Host "📝 Titulo: $($response.result.titulo)" -ForegroundColor White
    $hashtags = $response.result.hashtags -join ', '
    Write-Host "📊 Hashtags: $hashtags" -ForegroundColor Yellow
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.Exception.Response) {
        Write-Host "Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Gray
    }
}

# Teste 2: Gerador Ideias
Write-Host "`n2. Testando Gerador Ideias:" -ForegroundColor Cyan
try {
    $body = @{
        tool = "gerador-ideias"
        inputs = @{
            quantidade = 3
            formato = "posts"
            nicho = "tecnologia"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -ContentType "application/json" -ErrorAction Stop
    Write-Host "✅ Sucesso!" -ForegroundColor Green
    Write-Host "💡 Ideias geradas: $($response.result.Count)" -ForegroundColor White
    Write-Host "🎯 Primeira ideia: $($response.result[0].ideia)" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 3: Analise Perfil
Write-Host "`n3. Testando Analise Perfil:" -ForegroundColor Cyan
try {
    $body = @{
        tool = "analise-perfil"
        inputs = @{
            rede = "instagram"
            nicho = "moda sustentavel"
            seguidores = 5000
            frequencia = "3 posts por semana"
            desafio = "baixo engajamento"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -ContentType "application/json" -ErrorAction Stop
    Write-Host "✅ Sucesso!" -ForegroundColor Green
    $scoreGeral = $response.result.score_geral
    Write-Host "📊 Score geral: $scoreGeral/100" -ForegroundColor White
    $diagnostico = $response.result.diagnostico
    Write-Host "🔍 Diagnostico: $diagnostico" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n🎯 Testes concluidos!" -ForegroundColor Green
Write-Host "📊 Verifique os logs no dashboard Supabase" -ForegroundColor Yellow
Write-Host "🗄️ Tabela ia_studio_outputs deve conter os dados gerados" -ForegroundColor Cyan
