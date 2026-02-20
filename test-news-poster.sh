#!/bin/bash

# Teste Manual do News Poster
echo "🧪 Teste Manual - News Poster Edge Function"

echo "📡 Testando Edge Function..."
response=$(curl -s -X POST "https://hzmtdfojctctvgqjdbex.supabase.co/functions/v1/news-poster" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6bXRkZm9qY3RjdHZncWpkYmV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2NDUwMTIsImV4cCI6MjA3OTIyMTAxMn0.bv_6SFc_vNnw_eIyD73xNsRVXtL0guSbMRNuCthIy4Q" \
  -H "Content-Type: application/json")

echo "📊 Resposta:"
echo "$response" | jq '.'

# Verificar logs no Supabase
echo ""
echo "🔍 Verificar logs em: https://supabase.com/dashboard/project/hzmtdfojctctvgqjdbex/functions/logs"

# Verificar tabela news_posts
echo ""
echo "📋 Verificar posts salvos:"
curl -s -X POST "https://hzmtdfojctctvgqjdbex.supabase.co/rest/v1/news_posts?select=*&order=posted_at.desc&limit=5" \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6bXRkZm9qY3RjdHZncWpkYmV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2NDUwMTIsImV4cCI6MjA3OTIyMTAxMn0.bv_6SFc_vNnw_eIyD73xNsRVXtL0guSbMRNuCthIy4Q" \
  -H "Content-Type: application/json" | jq '.'
