# 🚀 AUTOMAÇÃO COMPLETA - NEWPOST-IA

## 📋 SISTEMA CRIADO

### ✅ **Edge Function Automática**
- **Localização**: `supabase/functions/auto-generate/index.ts`
- **Função**: Gera posts automaticamente nos horários agendados
- **Fonte**: News API (notícias reais)
- **Fallback**: Posts template se não encontrar notícias

### ✅ **GitHub Actions Scheduler**
- **Localização**: `.github/workflows/auto-generate.yml`
- **Horários**: 08:00, 10:00, 12:00, 14:00, 16:00, 18:00 (Fortaleza)
- **Funcionamento**: Chama Edge Function automaticamente
- **Manual**: Pode ser acionado manualmente

---

## 🛠️ **PASSOS PARA ATIVAR AUTOMAÇÃO**

### **Passo 1: Deploy da Edge Function**
1. **Instale Supabase CLI**:
   ```bash
   npm install -g supabase
   ```

2. **Faça login no Supabase**:
   ```bash
   supabase login
   ```

3. **Link com seu projeto**:
   ```bash
   supabase link --project-ref ykswhzqdjoshjoaruhqs
   ```

4. **Deploy da função**:
   ```bash
   supabase functions deploy auto-generate
   ```

### **Passo 2: Ativar GitHub Actions**
1. **Faça commit** dos arquivos:
   ```bash
   git add .
   git commit -m "Add automation system"
   git push
   ```

2. **Ative Actions** no GitHub:
   - Vá para o repositório no GitHub
   - Clique em "Actions"
   - Ative os workflows

---

## 🎯 **COMO FUNCIONA**

### **Horários Automáticos** (Fortaleza/UTC-3):
- **08:00** - Posts da manhã
- **10:00** - Posts do meio-dia
- **12:00** - Posts do almoço
- **14:00** - Posts da tarde
- **16:00** - Posts do fim de tarde
- **18:00** - Posts da noite

### **Processo Automático**:
1. **GitHub Actions** dispara nos horários
2. **Chama Edge Function** no Supabase
3. **Busca agendamentos** do horário atual
4. **Gera posts** via News API
5. **Salva no banco** de dados
6. **Atualiza status** para "generated"

---

## 📱 **USO MANUAL**

### **Gerar Posts Agora**:
1. **Acesse**: http://localhost:3001
2. **Vá para**: "📅 Agendamento Automático"
3. **Clique**: "Gerar Agora"

### **Ver Posts Gerados**:
1. **Acesse**: https://supabase.com/dashboard/project/ykswhzqdjoshjoaruhqs
2. **Vá para**: **Table Editor**
3. **Selecione**: `generated_posts`

---

## 🔧 **TESTE DA AUTOMAÇÃO**

### **Teste Manual da Edge Function**:
```bash
curl -X POST "https://ykswhzqdjoshjoaruhqs.supabase.co/functions/v1/auto-generate" \
  -H "Authorization: Bearer sb_secret_kiKzSFZcF_j4aLkXU1aAAw_ILHfST7Q" \
  -H "Content-Type: application/json" \
  -d '{}'
```

### **Teste do GitHub Actions**:
1. **Vá para**: GitHub > Actions
2. **Clique**: "Auto Generate Posts"
3. **Clique**: "Run workflow"

---

## 🎉 **RESULTADO ESPERADO**

### **Após Ativação**:
- ✅ **Posts gerados** automaticamente 6x ao dia
- ✅ **Notícias reais** das categorias configuradas
- ✅ **Sem intervenção manual**
- ✅ **Logs de execução** no GitHub e Supabase

### **Posts Prontos**:
- 📱 **Formato ideal** para redes sociais
- 🔗 **Links das notícias** incluídos
- 🏷️ **Hashtags relevantes**
- 📊 **Rastreio de origem**

---

## 🚀 **SISTEMA 100% AUTOMÁTICO!**

**Parabéns! Seu sistema de geração automática de posts está completo!**

- 🤖 **Geração automática** ✅
- ⏰ **Horários configurados** ✅
- 📰 **Notícias reais** ✅
- 📱 **Pronto para usar** ✅

**Agora é só deixar rodar e copiar os posts gerados!** 🎯
