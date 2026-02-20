#!/bin/bash

# Deploy Script para News Poster Supabase
# Uso: ./deploy-news-poster.sh

echo "🚀 Deploy News Poster para Supabase"

# Verificar se supabase CLI está instalado
if ! command -v supabase &> /dev/null; then
    echo "❌ Supabase CLI não encontrado. Instale com:"
    echo "npm install -g supabase"
    exit 1
fi

# Deploy da Edge Function
echo "📦 Deploy Edge Function..."
supabase functions deploy news-poster

# Verificar deploy
echo "✅ Verificando deploy..."
supabase functions list

# Habilitar extensions e cron
echo "⚙️ Configurando cron job..."
supabase db push --schema supabase/enable_cron.sql

# Verificar cron
echo "🕐 Verificando cron job..."
supabase db run --command "SELECT * FROM cron.job WHERE jobname = 'news-poster-60min'"

# Teste manual
echo "🧪 Teste manual da Edge Function..."
curl -X POST "https://hzmtdfojctctvgqjdbex.supabase.co/functions/v1/news-poster" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6bXRkZm9qY3RjdHZncWpkYmV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2NDUwMTIsImV4cCI6MjA3OTIyMTAxMn0.bv_6SFc_vNnw_eIyD73xNsRVXtL0guSbMRNuCthIy4Q" \
  -H "Content-Type: application/json"

echo "✅ Deploy concluído!"
echo "📊 O cron job vai executar a cada 60min automaticamente"
echo "🔍 Verifique os logs em: https://supabase.com/dashboard/project/hzmtdfojctctvgqjdbex/functions/logs"
