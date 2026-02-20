-- NEWPOST-IA AUTO 3 POSTS/DIA - SETUP CORRIGIDO 2026
-- Projeto: zsxcdadgjpsekzzmcdro | Timezone: Fortaleza/CE (-03)

-- 1. Extensions
CREATE EXTENSION IF NOT EXISTS pg_cron, pg_net;

-- 2. Tabela melhorada (UNIQUE niche+posted_at evita duplicatas)
DROP TABLE IF EXISTS auto_posts;  -- Reset limpo
CREATE TABLE auto_posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  niche TEXT NOT NULL,
  content TEXT NOT NULL,
  image_url TEXT,
  engagement NUMERIC DEFAULT 0,
  posted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  status TEXT DEFAULT 'pending'  -- pending/posted/error
);

-- 3. Índices otimizados
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_auto_posts_niche ON auto_posts(niche);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_auto_posts_posted_at ON auto_posts(posted_at DESC);

-- 4. Variáveis para DRY (evita repetição)
DO $$
DECLARE
  api_url TEXT := 'https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/auto-content';
  auth_header JSONB := '{"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3Z21yeHp2bWpranRyYXRjdXpmbiIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNzE2NjUyNjUzLCJleHAiOjIwMzIxMDI2NTN9.5lqZF8QhHqX5YxL2A4n8k7J9X8mN7p2q1r3s4t5u6v", "Content-Type": "application/json"}'::jsonb;
BEGIN
  -- Cron 8h (America/Fortaleza)
  PERFORM cron.schedule('auto-content-8h', '0 8 * * * America/Fortaleza',
    'SELECT net.http_post(' || quote_literal(api_url) || ', ' || auth_header::text || ', ''{"trigger": "cron", "schedule": "8h"}''::jsonb);'
  );
  
  -- Cron 14h
  PERFORM cron.schedule('auto-content-14h', '0 14 * * * America/Fortaleza',
    'SELECT net.http_post(' || quote_literal(api_url) || ', ' || auth_header::text || ', ''{"trigger": "cron", "schedule": "14h"}''::jsonb);'
  );
  
  -- Cron 20h
  PERFORM cron.schedule('auto-content-20h', '0 20 * * * America/Fortaleza',
    'SELECT net.http_post(' || quote_literal(api_url) || ', ' || auth_header::text || ', ''{"trigger": "cron", "schedule": "20h"}''::jsonb);'
  );
END $$;

-- 5. Exemplo de post teste (insira manual)
INSERT INTO auto_posts (niche, content, image_url, status) VALUES 
('tecnologia', 'IA revoluciona NewPost-IA com posts auto!', 'https://exemplo.com/ia.jpg', 'posted')
ON CONFLICT (niche, posted_at) DO NOTHING;

-- 6. Verificar crons e tabela
SELECT * FROM cron.job WHERE jobname LIKE 'auto-content%';
SELECT COUNT(*) FROM auto_posts;
