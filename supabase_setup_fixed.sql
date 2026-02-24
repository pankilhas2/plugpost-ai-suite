-- SQL CORRIGIDO - Execute este no Supabase

-- 1. Criar tabela scheduled_posts
CREATE TABLE IF NOT EXISTS public.scheduled_posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id TEXT DEFAULT 'test-user',
  scheduled_time TIME NOT NULL,
  category TEXT NOT NULL CHECK (category IN ('tecnologia', 'brasil', 'economia')),
  quantity INTEGER DEFAULT 3 CHECK (quantity >= 1 AND quantity <= 10),
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'generated', 'failed')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Criar tabela generated_posts
CREATE TABLE IF NOT EXISTS public.generated_posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  scheduled_id UUID REFERENCES public.scheduled_posts(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  category TEXT NOT NULL,
  generated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  copied BOOLEAN DEFAULT FALSE,
  copied_at TIMESTAMP WITH TIME ZONE,
  original_news JSONB
);

-- 3. Habilitar RLS
ALTER TABLE public.scheduled_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.generated_posts ENABLE ROW LEVEL SECURITY;

-- 4. Remover políticas existentes (se houver)
DROP POLICY IF EXISTS "Enable all operations on scheduled_posts" ON public.scheduled_posts;
DROP POLICY IF EXISTS "Enable all operations on generated_posts" ON public.generated_posts;

-- 5. Criar políticas RLS
CREATE POLICY "Enable all operations on scheduled_posts" 
ON public.scheduled_posts FOR ALL 
USING (true) 
WITH CHECK (true);

CREATE POLICY "Enable all operations on generated_posts" 
ON public.generated_posts FOR ALL 
USING (true) 
WITH CHECK (true);

-- 6. Criar função para updated_at
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;

-- 7. Criar trigger
DROP TRIGGER IF EXISTS update_scheduled_posts_updated_at ON public.scheduled_posts;
CREATE TRIGGER update_scheduled_posts_updated_at
BEFORE UPDATE ON public.scheduled_posts
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at_column();

-- 8. Inserir dados de teste
INSERT INTO public.scheduled_posts (scheduled_time, category, quantity) 
VALUES 
  ('08:00:00', 'tecnologia', 3),
  ('10:00:00', 'brasil', 3),
  ('12:00:00', 'economia', 3),
  ('14:00:00', 'tecnologia', 3),
  ('16:00:00', 'brasil', 3),
  ('18:00:00', 'economia', 3)
ON CONFLICT DO NOTHING;

-- 9. Verificar criação
SELECT 'scheduled_posts criada com sucesso!' as status;
SELECT COUNT(*) as total_scheduled FROM public.scheduled_posts;
