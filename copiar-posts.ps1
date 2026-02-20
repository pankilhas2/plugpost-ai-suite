# Script para gerar posts prontos para NewPost-IA
# Escolha a categoria: tecnologia, brasil ou economia

$category = "tecnologia"  # Mude para "brasil" ou "economia" se quiser
$count = 3  # Número de posts que quer gerar

Write-Host "🚀 Gerando $count posts de $category..." -ForegroundColor Green

# Chamar a API
$response = Invoke-RestMethod -Uri "https://paddle-billing-subscription-starter-pank-2.vercel.app/api/ready-posts" -Method POST -Body "{`"category`":`"$category`",`"count`":$count}" -ContentType "application/json"

if ($response.success -eq $true) {
    Write-Host "✅ Posts gerados com sucesso!" -ForegroundColor Green
    Write-Host "📱 Copie os posts abaixo:" -ForegroundColor Yellow
    Write-Host ""
    
    for ($i = 0; $i -lt $response.posts.Count; $i++) {
        $post = $response.posts[$i]
        Write-Host "=== POST $($i + 1) ===" -ForegroundColor Cyan
        Write-Host $post.content -ForegroundColor White
        Write-Host ""
        Write-Host "📰 Fonte: $($post.original_news.title)" -ForegroundColor Gray
        Write-Host "🔗 Link: $($post.original_news.link)" -ForegroundColor Gray
        Write-Host ""
        Write-Host "---" -ForegroundColor DarkGray
        Write-Host ""
    }
    
    Write-Host "🎯 Posts prontos! Agora copie e cole na NewPost-IA!" -ForegroundColor Green
    Write-Host "🌐 Acesse: https://plugpost-ai.lovable.app/" -ForegroundColor Blue
    
} else {
    Write-Host "❌ Erro ao gerar posts: $($response.error)" -ForegroundColor Red
}

# Manter janela aberta
Read-Host "Pressione ENTER para fechar"
