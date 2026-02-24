-- SQL para desabilitar RLS temporariamente
-- Execute isso no SQL Editor do Supabase

-- Desabilitar RLS para teste
ALTER TABLE public.scheduled_posts DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.generated_posts DISABLE ROW LEVEL SECURITY;

-- Verificar se funciona
SELECT 'RLS desabilitado para teste' as status;
