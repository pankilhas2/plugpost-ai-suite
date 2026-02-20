@echo off
echo 🚀 Deploy NewPost-IA Auto Content Function
echo.

echo 1. Verificando Supabase CLI...
supabase --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Supabase CLI não encontrado. Instale com: npm install -g supabase
    pause
    exit /b 1
)

echo 2. Fazendo login no Supabase...
supabase login

echo 3. Linkando ao projeto...
supabase link --project-ref zsxcdadgjpsekzzmcdro

echo 4. Deploy da Edge Function auto-content...
supabase functions deploy auto-content --no-verify-jwt

echo 5. Verificando status...
supabase functions list

echo.
echo ✅ Deploy concluído!
echo 📊 Teste manual: curl -X POST "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/auto-content" -H "Authorization: Bearer SUA_CHAVE" -H "Content-Type: application/json" -d "{\"trigger\": \"manual\"}"
echo.
pause
