# Teste de conexão com Supabase
$headers = @{
    "apikey" = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v"
    "Authorization" = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v"
    "Content-Type" = "application/json"
}

try {
    Write-Host "Testando conexão com Supabase..."
    $response = Invoke-RestMethod -Uri "https://zsxcdadgjpsekzzmcdro.supabase.co/rest/v1/" -Method GET -Headers $headers
    Write-Host "✅ Conexão bem-sucedida!"
    Write-Host "Response: $($response | ConvertTo-Json -Compress)"
} catch {
    Write-Host "❌ Erro na conexão:"
    Write-Host $_.Exception.Message
    if ($_.Exception.Response) {
        Write-Host "Status Code: $($_.Exception.Response.StatusCode)"
    }
}
