@echo off
echo 🧪 NEWPOST-IA AUTO - Teste Manual (PROJETO CORRETO)
echo.

echo 📡 Testando Edge Function...
curl -s -X POST "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/auto-content" ^
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v" ^
  -H "Content-Type: application/json" | jq .

echo.
echo 📋 Verificando posts gerados...
curl -s -X POST "https://zsxcdadgjpsekzzmcdro.supabase.co/rest/v1/auto_posts?select=*&order=posted_at.desc&limit=5" ^
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v" ^
  -H "Content-Type: application/json" | jq .

echo.
echo 🔍 Dashboard: https://supabase.com/dashboard/project/zsxcdadgjpsekzzmcdro
echo 📊 SQL para verificar: SELECT * FROM auto_posts ORDER BY posted_at DESC LIMIT 10;
echo 📋 Logs: Edge Functions → auto-content → Logs
pause
