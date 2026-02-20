-- VERIFICAÇÃO DE TABELAS SUPABASE - NEWPOST-IA
-- Execute no SQL Editor do Dashboard Supabase

-- 1. Lista todas tabelas no schema 'public' (recomendado)
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- 2. Query completa (com schema e tipo)
SELECT schemaname AS schema, 
       tablename AS table_name, 
       tableowner AS owner
FROM pg_tables 
WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
ORDER BY schemaname, tablename;

-- 3. Verificar estrutura da tabela auto_posts (se existir)
\d auto_posts;

-- 4. Contagem de registros em auto_posts
SELECT COUNT(*) AS total_posts FROM auto_posts;

-- 5. Verificar estrutura da tabela news_posts (se existir)
\d news_posts;

-- 6. Contagem de registros em news_posts
SELECT COUNT(*) AS total_news_posts FROM news_posts;

-- 7. Verificar crons ativos
SELECT jobname, schedule, command 
FROM cron.job 
WHERE jobname LIKE '%auto%' 
ORDER BY jobname;

-- 8. Logs recentes dos crons (últimas 24h)
SELECT jobname, status, start_time, end_time, return_message
FROM cron.job_run_details 
WHERE job_pid IS NOT NULL 
  AND start_time >= NOW() - INTERVAL '24 hours'
ORDER BY start_time DESC 
LIMIT 10;

-- 9. Verificar se extensões estão instaladas
SELECT extname, extversion 
FROM pg_extension 
WHERE extname IN ('pg_cron', 'pg_net');

-- 10. Testar conexão com News API (via pg_net)
SELECT net.http_get(
  'https://newsapi.org/v2/top-headlines?country=br&apiKey=f3a04b2b1ba84df08775a962e06f77b0&pageSize=1'
) as news_api_test;
