# Teste final da API
Write-Host "Testando API..." -ForegroundColor Green

$body = '{"categoria":"technology","quantidade":2,"pais":"br"}'
$response = Invoke-RestMethod -Uri "http://localhost:3001/api/gerar-posts" -Method POST -Body $body -ContentType "application/json"
Write-Host "Posts encontrados: $($response.posts.Count)" -ForegroundColor Green
