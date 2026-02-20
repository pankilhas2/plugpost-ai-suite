# Verificar tabelas existentes no Supabase
$headers = @{
    "apikey" = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v"
    "Authorization" = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v"
    "Content-Type" = "application/json"
    "Prefer" = "return=representation"
}

try {
    Write-Host "Verificando tabelas existentes..."
    
    # Tentar listar tabelas via information_schema
    $sql = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name;"
    $body = @{ "query" = $sql } | ConvertTo-Json
    
    $response = Invoke-RestMethod -Uri "https://zsxcdadgjpsekzzmcdro.supabase.co/rest/v1/rpc/sql" -Method POST -Headers $headers -Body $body
    Write-Host "✅ Tabelas encontradas:"
    $response | ForEach-Object { Write-Host "  - $_" }
    
} catch {
    Write-Host "❌ Erro ao verificar tabelas:"
    Write-Host $_.Exception.Message
    
    # Tentar abordagem alternativa - verificar se tabela auto_posts existe
    try {
        Write-Host "Tentando verificar tabela auto_posts diretamente..."
        $response = Invoke-RestMethod -Uri "https://zsxcdadgjpsekzzmcdro.supabase.co/rest/v1/auto_posts?select=count&limit=1" -Method GET -Headers $headers
        Write-Host "✅ Tabela auto_posts existe ou não retornou erro"
    } catch {
        Write-Host "❌ Tabela auto_posts não existe ou acesso negado"
    }
}
