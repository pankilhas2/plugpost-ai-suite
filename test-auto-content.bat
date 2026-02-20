@echo off
echo 🧪 NEWPOST-IA AUTO - Teste Manual
echo.

echo 📡 Testando Edge Function...
curl -s -X POST "https://hzmtdfojctctvgqjdbex.supabase.co/functions/v1/auto-content" ^
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6bXRkZm9qY3RjdHZncWpkYmV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2NDUwMTIsImV4cCI6MjA3OTIyMTAxMn0.bv_6SFc_vNnw_eIyD73xNsRVXtL0guSbMRNuCthIy4Q" ^
  -H "Content-Type: "application/json" | jq .

echo.
echo 📋 Verificando posts gerados...
curl -s -X POST "https://hzmtdfojctctvgqjdbex.supabase.co/rest/v1/auto_posts?select=*&order=posted_at.desc&limit=5" ^
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6bXRkZm9qY3RjdHZncWpkYmV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2NDUwMTIsImV4cCI6MjA3OTIyMTAxMn0.bv_6SFc_vNnw_eIyD73xNsRVXtL0guSbMRNuCthIy4Q" ^
  -H "Content-Type: application/json" | jq .

echo.
echo 🔍 Verificar logs em: https://supabase.com/dashboard/project/hzmtdfojctctvgqjdbex/functions/logs
echo 📊 Verificar posts em: SELECT * FROM auto_posts ORDER BY posted_at DESC LIMIT 10;
pause
