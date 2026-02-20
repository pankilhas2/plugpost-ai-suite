# Script para executar setup do Supabase
$sql = Get-Content "setup_supabase.sql" -Raw

$headers = @{
    "apikey" = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v"
    "Authorization" = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v"
    "Content-Type" = "application/json"
}

$body = @{
    "sql" = $sql
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://zsxcdadgjpsekzzmcdro.supabase.co/rest/v1/rpc/execute_sql" -Method POST -Headers $headers -Body $body
    Write-Host "✅ Setup executado com sucesso!"
    $response | ConvertTo-Json -Depth 10
} catch {
    Write-Host "❌ Erro ao executar setup:"
    Write-Host $_.Exception.Message
    Write-Host $_.Exception.Response.StatusCode
}
