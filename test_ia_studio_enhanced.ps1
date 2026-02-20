# Teste da IA Studio Edge Function com melhorias (logging, persistência, rate limiting)
Write-Host "🎨 Testando IA Studio Enhanced..." -ForegroundColor Green

$baseUrl = "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/ia-studio-generate"
$anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzQ3OTM3NDc3LCJleHAiOjIwNjM1MTM0NDczN30.SOeBiP4a64kDCDPctXbs34TJ2lox7sZrq0T0l-ZuSyo"

$headers = @{
    'Authorization' = "Bearer $anonKey"
    'Content-Type' = 'application/json'
    'user-id' = 'test-user-123'
}

# Teste 1: Post Perfeito
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
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -Headers $headers
    Write-Host "✅ Sucesso!" -ForegroundColor Green
    Write-Host "📝 Título: $($response.result.titulo)" -ForegroundColor White
    $hashtags = $response.result.hashtags -join ', '
    Write-Host "📊 Hashtags: $hashtags" -ForegroundColor Yellow
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.Exception.Response) {
        Write-Host "Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Gray
    }
}

# Teste 2: Rate Limiting (rápido para testar)
Write-Host "`n2. Testando Rate Limiting (5 requisições rápidas):" -ForegroundColor Cyan
for ($i = 1; $i -le 5; $i++) {
    try {
        $body = @{
            tool = "gerador-ideias"
            inputs = @{
                quantidade = 3
                formato = "posts"
                nicho = "tecnologia"
            }
        } | ConvertTo-Json -Depth 3
        
        $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -Headers $headers
        Write-Host "✅ Requisição $i: Sucesso" -ForegroundColor Green
    } catch {
        if ($_.Exception.Response.StatusCode -eq 429) {
            Write-Host "🚫 Requisição $i: Rate limit atingido!" -ForegroundColor Yellow
            break
        } else {
            Write-Host "❌ Requisição $i: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    Start-Sleep -Milliseconds 100
}

# Teste 3: Pacote 30 Posts
Write-Host "`n3. Testando Pacote 30 Posts:" -ForegroundColor Cyan
try {
    $body = @{
        tool = "pacote-30"
        inputs = @{
            nicho = "finanças pessoais"
            publico = "jovens adultos"
            objetivo = "engajamento"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -Headers $headers
    Write-Host "✅ Calendário gerado!" -ForegroundColor Green
    $postsCount = $response.result.Count
    Write-Host "📅 Posts gerados: $postsCount" -ForegroundColor White
    $primeiroPost = $response.result[0].tema
    Write-Host "🎯 Primeiro post: $primeiroPost" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 4: Análise de Perfil
Write-Host "`n4. Testando Análise de Perfil:" -ForegroundColor Cyan
try {
    $body = @{
        tool = "analise-perfil"
        inputs = @{
            rede = "instagram"
            nicho = "moda sustentável"
            seguidores = 5000
            frequencia = "3 posts por semana"
            desafio = "baixo engajamento"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -Headers $headers
    Write-Host "✅ Análise completa!" -ForegroundColor Green
    $scoreGeral = $response.result.score_geral
    Write-Host "📊 Score geral: $scoreGeral/100" -ForegroundColor White
    $diagnostico = $response.result.diagnostico
    Write-Host "🔍 Diagnóstico: $diagnostico" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Erro: $($_.Exception.Message)" -ForegroundColor Red
}

# Teste 5: Ferramenta inválida
Write-Host "`n5. Testando Ferramenta Inválida:" -ForegroundColor Cyan
try {
    $body = @{
        tool = "ferramenta-inexistente"
        inputs = @{
            teste = "valor"
        }
    } | ConvertTo-Json -Depth 3
    
    $response = Invoke-RestMethod -Uri $baseUrl -Method POST -Body $body -Headers $headers
    Write-Host "❌ Deveria dar erro!" -ForegroundColor Red
} catch {
    Write-Host "✅ Erro esperado: $($_.Exception.Message)" -ForegroundColor Green
}

Write-Host "`n🎯 Testes concluídos!" -ForegroundColor Green
Write-Host "📊 Verifique os logs no dashboard Supabase para ver logging e persistência!" -ForegroundColor Yellow
Write-Host "🗄️ Tabela ia_studio_outputs deve conter os dados gerados" -ForegroundColor Cyan
