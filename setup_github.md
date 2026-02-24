# 🚀 CONFIGURAÇÃO GITHUB ACTIONS

## 📋 PASSOS PARA ATIVAR AUTOMAÇÃO

### Passo 1: Criar Repositório
1. Acesse: https://github.com/new
2. Nome: `newpost-ia-auto-content`
3. Descrição: `Sistema automático de geração de posts com IA`
4. Marque: Public ou Private
5. Clique: "Create repository"

### Passo 2: Conectar ao Repositório
No terminal, execute:
```bash
# Remover remote antigo
git remote remove origin

# Adicionar seu novo remote
git remote add origin https://github.com/SEU_USERNAME/newpost-ia-auto-content.git

# Fazer push
git push --set-upstream origin main
```

### Passo 3: Ativar GitHub Actions
1. Vá para seu repositório no GitHub
2. Clique em "Actions"
3. Se solicitado, ative os workflows
4. O workflow "Auto Generate Posts" aparecerá automaticamente

### Passo 4: Configurar Secrets (Opcional)
Se quiser mais segurança:
1. Vá para Settings > Secrets and variables > Actions
2. Adicione:
   - `SUPABASE_URL`: https://ykswhzqdjoshjoaruhqs.supabase.co
   - `SUPABASE_ANON_KEY`: sb_publishable_IZ0LgQkdpo7bVMySqz4C1w_zrxjLGcv
   - `SUPABASE_SERVICE_KEY`: sb_secret_kiKzSFZcF_j4aLkXU1aAAw_ILHfST7Q

### Passo 5: Testar Workflow
1. Em Actions, clique em "Auto Generate Posts"
2. Clique em "Run workflow"
3. Aguarde a execução

## 🎯 RESULTADO ESPERADO

Após configurar:
- ✅ GitHub Actions ativo
- ✅ Geração automática 6x ao dia
- ✅ Posts prontos para copiar
- ✅ Sistema 100% funcional

## 🚀 SISTEMA PRONTO!

Parabéns! Seu sistema de automação completa está pronto!
