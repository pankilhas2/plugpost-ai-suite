# 🚀 DEPLOY MANUAL - EDGE FUNCTION

## 📋 MÉTODO VIA PAINEL SUPABASE

Como as ferramentas CLI estão com problemas, vamos usar o painel web!

---

## 🛠️ PASSO 1: CRIAR EDGE FUNCTION MANUALMENTE

### 1. Acessar Painel
1. **Abra**: https://supabase.com/dashboard/project/ykswhzqdjoshjoaruhqs
2. **Faça login** com suas credenciais
3. **Vá para**: **Edge Functions** (menu lateral)

### 2. Criar Nova Função
1. **Clique em**: **"New Function"**
2. **Nome**: `auto-generate`
3. **Runtime**: **Deno**
4. **Clique em**: **"Create"**

### 3. Colar o Código
1. **Abra o arquivo**: `supabase/functions/auto-generate/index.ts`
2. **Copie TODO** o conteúdo
3. **Cole** no editor do Supabase
4. **Clique em**: **"Save"**

---

## 🛠️ PASSO 2: CONFIGURAR VARIÁVEIS DE AMBIENTE

### 1. Secrets da Função
1. **Na página da função**, clique em **"Function secrets"**
2. **Adicione os secrets**:
   - `SUPABASE_URL`: `https://ykswhzqdjoshjoaruhqs.supabase.co`
   - `SUPABASE_ANON_KEY`: `sb_publishable_IZ0LgQkdpo7bVMySqz4C1w_zrxjLGcv`

### 2. Salvar Secrets
1. **Clique em**: **"Save secrets"**

---

## 🛠️ PASSO 3: TESTAR FUNÇÃO

### 1. Teste Manual
1. **Na página da função**, clique em **"Run"**
2. **Method**: **POST**
3. **Body**: `{}` (vazio)
4. **Clique em**: **"Run function"**

### 2. Verificar Resultado
Deve aparecer algo como:
```json
{
  "success": true,
  "message": "No scheduled posts found for time: 15:30",
  "time": "15:30"
}
```

---

## 🛠️ PASSO 4: ATIVAR GITHUB ACTIONS

### 1. Fazer Commit
```bash
git add .
git commit -m "Add automation system"
git push
```

### 2. Ativar Actions
1. **Vá para**: Seu repositório no GitHub
2. **Clique em**: **"Actions"**
3. **Ative os workflows** se solicitado

### 3. Testar Workflow
1. **Em Actions**, clique em **"Auto Generate Posts"**
2. **Clique em**: **"Run workflow"**
3. **Aguarde** a execução

---

## 🎯 URL DA FUNÇÃO

Após deploy, a função estará disponível em:
```
https://ykswhzqdjoshjoaruhqs.supabase.co/functions/v1/auto-generate
```

---

## 🚀 TESTE FINAL

### Teste via curl:
```bash
curl -X POST "https://ykswhzqdjoshjoaruhqs.supabase.co/functions/v1/auto-generate" \
  -H "Authorization: Bearer sb_secret_kiKzSFZcF_j4aLkXU1aAAw_ILHfST7Q" \
  -H "Content-Type: application/json" \
  -d '{}'
```

---

## 🎉 RESULTADO ESPERADO

Após seguir esses passos:
- ✅ **Edge Function criada** e funcionando
- ✅ **GitHub Actions ativo** e agendado
- ✅ **Posts gerados** automaticamente
- ✅ **Sistema 100% automático**

---

## 📱 MONITORAMENTO

### Verificar Posts Gerados:
1. **No Supabase**: Table Editor → `generated_posts`
2. **Na aplicação**: http://localhost:3001 → aba agendamento

### Verificar Logs:
1. **GitHub Actions**: Logs de execução
2. **Supabase**: Logs da Edge Function

---

## 🚀 SISTEMA PRONTO!

**Parabéns! Seu sistema de automação completa está pronto!**

- 🤖 **Geração automática** ✅
- ⏰ **6x ao dia** ✅
- 📰 **Notícias reais** ✅
- 📱 **Interface completa** ✅

**Agora é só deixar rodar e copiar os posts!** 🎯
