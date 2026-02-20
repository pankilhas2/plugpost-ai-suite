# Ver posts salvos no Supabase

Write-Host "🗄️ Verificando posts no Supabase..." -ForegroundColor Green

# Configuração do Supabase
$SUPABASE_URL = "https://zsxcdadgjpsekzzmcdro.supabase.co"
$SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVhYWxwdmhocHV1cmpwdGh5cnZ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDc5Mzc0NzcsImV4cCI6MjA2MzUxMzQ3N30.SOeBiP4a64kDCDPctXbs34TJ2lox7sZrq0T0l-ZuSyo"

try {
    # Buscar posts recentes
    $headers = @{
        "apikey" = $SUPABASE_KEY
        "Authorization" = "Bearer $SUPABASE_KEY"
    }
    
    $response = Invoke-RestMethod -Uri "$SUPABASE_URL/rest/v1/news_posts?order=timestamp.desc&limit=10" -Method GET -Headers $headers
    
    Write-Host "`n📝 Posts encontrados: $($response.Count)" -ForegroundColor Cyan
    
    foreach ($post in $response) {
        Write-Host "`n=== POST ID: $($post.id) ===" -ForegroundColor Yellow
        Write-Host "Categoria: $($post.category)" -ForegroundColor White
        Write-Host "Data: $($post.timestamp)" -ForegroundColor Gray
        Write-Host "Conteúdo:" -ForegroundColor White
        Write-Host $post.content -ForegroundColor Cyan
        Write-Host "---" -ForegroundColor Gray
    }
    
} catch {
    Write-Host "❌ Erro ao acessar Supabase: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Verifique se a tabela news_posts existe no Supabase." -ForegroundColor Yellow
}
