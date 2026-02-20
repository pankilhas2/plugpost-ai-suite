-- DIAGNÓSTICO E CORREÇÃO NEWPOST-IA - 2026
-- Execute TUDO no SQL Editor do Supabase

-- 1. VERIFICAÇÃO INICIAL
-- Listar todas tabelas
SELECT schemaname, tablename FROM pg_tables WHERE schemaname NOT IN ('pg_catalog', 'information_schema');

-- Verificar auto_posts
SELECT COUNT(*) FROM auto_posts;  -- ou erro se não existir

-- Crons ativos
SELECT * FROM cron.job WHERE jobname LIKE '%auto%';

-- Logs recentes cron (últimas 24h)
SELECT * FROM cron.job_run_details WHERE job_pid IS NOT NULL ORDER BY start_time DESC LIMIT 10;

-- 2. PARAR CRONS ANTIGOS
SELECT cron.unschedule('auto-content-8h');
SELECT cron.unschedule('auto-content-14h');
SELECT cron.unschedule('auto-content-20h');
SELECT cron.unschedule('auto-content-8h-fix');
SELECT cron.unschedule('auto-content-14h-fix');
SELECT cron.unschedule('auto-content-20h-fix');

-- 3. EXTENSIONS
CREATE EXTENSION IF NOT EXISTS pg_cron, pg_net;

-- 4. TABELA MELHORADA
DROP TABLE IF EXISTS auto_posts;
CREATE TABLE auto_posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  niche TEXT NOT NULL,
  content TEXT NOT NULL,
  image_url TEXT,
  engagement NUMERIC DEFAULT 0,
  posted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  status TEXT DEFAULT 'pending'
);

-- 5. ÍNDICES
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_auto_posts_niche ON auto_posts(niche);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_auto_posts_posted_at ON auto_posts(posted_at DESC);

-- 6. CRONS CORRIGIDOS - SUBSTITUA A CHAVE ABAIXO
DO $$
DECLARE
  api_url TEXT := 'https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/auto-content';
  -- ATENÇÃO: SUBSTITUA 'SUA_NOVA_ANON_KEY_AQUI' pela chave nova do Dashboard
  headers JSONB := '{"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v", "Content-Type": "application/json"}'::jsonb;
BEGIN
  -- 8h
  PERFORM cron.schedule('auto-content-8h-fix', '0 8 * * * America/Fortaleza',
    format('SELECT net.http_post(%L, %L::jsonb, %L::jsonb);', 
           api_url, 
           '{"trigger": "cron", "schedule": "8h"}',
           headers::text)
  );
  
  -- 14h
  PERFORM cron.schedule('auto-content-14h-fix', '0 14 * * * America/Fortaleza',
    format('SELECT net.http_post(%L, %L::jsonb, %L::jsonb);', 
           api_url, 
           '{"trigger": "cron", "schedule": "14h"}',
           headers::text)
  );
  
  -- 20h
  PERFORM cron.schedule('auto-content-20h-fix', '0 20 * * * America/Fortaleza',
    format('SELECT net.http_post(%L, %L::jsonb, %L::jsonb);', 
           api_url, 
           '{"trigger": "cron", "schedule": "20h"}',
           headers::text)
  );
END $$;

-- 7. TESTE MANUAL
SELECT net.http_post(
  'https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/auto-content',
  '{"trigger": "manual"}'::jsonb,
  '{"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v", "Content-Type": "application/json"}'::jsonb
);

-- 8. VERIFICAÇÃO FINAL
SELECT * FROM cron.job WHERE jobname LIKE 'auto-content%';
SELECT COUNT(*) FROM auto_posts;

-- 9. INSERIR POST TESTE
INSERT INTO auto_posts (niche, content, image_url, status) VALUES 
('tecnologia', 'IA revoluciona NewPost-IA com posts automáticos!', 'https://exemplo.com/ia.jpg', 'posted');
