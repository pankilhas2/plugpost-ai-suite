@echo off
echo 🚀 NEWPOST-IA AUTO 3 POSTS/DIA - Deploy Script
echo.

REM Verificar se tem Supabase CLI
where npx >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ npx não encontrado. Instale Node.js primeiro.
    pause
    exit /b 1
)

echo 📦 Deploy Edge Function...
npx supabase functions deploy auto-content --no-verify-jwt

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Erro no deploy da Edge Function
    pause
    exit /b 1
)

echo ✅ Edge Function deployada com sucesso!

echo.
echo 🧪 Teste manual...
curl -X POST "https://hzmtdfojctctvgqjdbex.supabase.co/functions/v1/auto-content" ^
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6bXRkZm9qY3RjdHZncWpkYmV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2NDUwMTIsImV4cCI6MjA3OTIyMTAxMn0.bv_6SFc_vNnw_eIyD73xNsRVXtL0guSbMRNuCthIy4Q" ^
  -H "Content-Type: application/json"

echo.
echo ✅ Deploy concluído!
echo 📊 Sistema vai postar 3x/dia: 8h, 14h, 20h
echo 🔍 Verifique os posts em: SELECT * FROM auto_posts ORDER BY posted_at DESC LIMIT 10;
pause
