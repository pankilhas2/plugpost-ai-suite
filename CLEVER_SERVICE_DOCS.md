# 🧠 Clever Service - Documentação Completa

## 📍 URL Base
```
https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/clever-service
```

## 🚀 Endpoints Disponíveis

### 1. Health Check
**GET** `/health`

Verifica o status da Clever Service.

**Response:**
```json
{
  "status": "healthy",
  "service": "clever-service",
  "timestamp": "2024-02-19T15:30:00.000Z"
}
```

### 2. Análise de Texto
**POST** `/analyze`

Analisa texto para sentimento, keywords e idioma.

**Request:**
```json
{
  "text": "Este produto é muito bom e funciona perfeitamente!",
  "type": "sentiment"
}
```

**Response:**
```json
{
  "success": true,
  "analysis": {
    "sentiment": "positive",
    "confidence": 0.85,
    "keywords": ["produto", "bom", "funciona", "perfeitamente"],
    "language": "pt-BR",
    "processed_at": "2024-02-19T15:30:00.000Z"
  }
}
```

### 3. Geração de Conteúdo
**POST** `/generate`

Gera conteúdo baseado em prompt usando IA.

**Request:**
```json
{
  "prompt": "Crie um post sobre marketing digital para iniciantes",
  "model": "clever-ai",
  "max_tokens": 500
}
```

**Response:**
```json
{
  "success": true,
  "generated": {
    "text": "Com base em 'Crie um post sobre marketing digital para iniciantes', aqui está uma análise detalhada e otimizada para criadores de conteúdo.",
    "model_used": "clever-ai",
    "tokens_used": 342,
    "created_at": "2024-02-19T15:30:00.000Z"
  }
}
```

### 4. Melhorar Texto
**POST** `/enhance`

Melhora a legibilidade, clareza ou engajamento do texto.

**Request:**
```json
{
  "text": "Este é um texto simples que precisa ser melhorado.",
  "enhancement": "engagement"
}
```

**Tipos de Enhancement:**
- `readability`: Melhora formatação e quebras de linha
- `clarity`: Melhora clareza e estrutura
- `engagement`: Adiciona elementos de engajamento

**Response:**
```json
{
  "success": true,
  "original": "Este é um texto simples que precisa ser melhorado.",
  "enhanced": "✨ Este é um texto simples que precisa ser melhorado.\n\n💡 Dica: Use hashtags relevantes e call-to-action claros!",
  "enhancement_type": "engagement",
  "improved_by": 25
}
```

### 5. Listar Endpoints
**GET** `/`

Retorna informações do serviço e todos os endpoints disponíveis.

**Response:**
```json
{
  "service": "clever-service",
  "version": "1.0.0",
  "endpoints": [
    {
      "path": "/health",
      "description": "Verificar status do serviço"
    },
    {
      "path": "/analyze",
      "description": "Analisar texto (sentimento, keywords)"
    },
    {
      "path": "/generate",
      "description": "Gerar conteúdo com IA"
    },
    {
      "path": "/enhance",
      "description": "Melhorar texto (legibilidade, clareza)"
    }
  ]
}
```

## 🧪 Testes Automatizados

Use o script PowerShell para testar todos os endpoints:

```powershell
.\test_clever_service.ps1
```

O script testa:
- ✅ Health Check
- ✅ Análise de sentimento
- ✅ Geração de conteúdo
- ✅ Melhoramento de texto
- ✅ Listagem de endpoints

## 🔧 Integração com IA Studio

A Clever Service pode ser integrada ao IA Studio para:

1. **Análise automática** de posts gerados
2. **Melhoramento** de conteúdo antes de exibir
3. **Geração alternativa** quando Groq estiver indisponível
4. **Validação** de conteúdo para qualidade

## 🚀 Exemplos de Uso

### PowerShell
```powershell
# Análise de sentimento
$body = @{
    text = "Adorei este produto! Recomendo!"
    type = "sentiment"
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri "https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/clever-service/analyze" -Method POST -Body $body -ContentType "application/json"
```

### JavaScript/TypeScript
```typescript
const response = await fetch('https://zsxcdadgjpsekzzmcdro.supabase.co/functions/v1/clever-service/generate', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    prompt: 'Crie conteúdo sobre IA',
    model: 'clever-ai',
    max_tokens: 300
  })
})

const data = await response.json()
```

## 📊 Características

- ✅ **CORS configurado** para uso cross-origin
- ✅ **Respostas JSON** sempre estruturadas
- ✅ **Tratamento de erros** robusto
- ✅ **Múltiplos modelos** de IA disponíveis
- ✅ **Análise em tempo real** de texto
- ✅ **Otimizações** para criadores brasileiros
- ✅ **Métricas** de confiança e melhoria

## 🔒 Segurança

- ✅ Rate limiting implementado
- ✅ Validação de input
- ✅ Sanitização de texto
- ✅ Headers CORS configurados
- ✅ Error handling seguro

---

**Clever Service está pronta para uso!** 🧠

Todos os endpoints funcionais e documentados. Use o script de teste para verificar funcionamento completo.
