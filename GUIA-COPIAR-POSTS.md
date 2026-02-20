# 📱 GUIA PASSO A PASSO - COPIAR POSTS PARA NEWPOST-IA

## 🔥 MÉTODO 1: PowerShell (Recomendado)

### Passo 1: Abrir PowerShell
- Pressione `Win + X`
- Clique em "Windows PowerShell" ou "Terminal"

### Passo 2: Copiar e colar este comando:

```
$response = Invoke-RestMethod -Uri "https://paddle-billing-subscription-starter-pank-2.vercel.app/api/ready-posts" -Method POST -Body '{"category":"tecnologia","count":3}' -ContentType "application/json"
Write-Host "🚀 Posts gerados:" -ForegroundColor Green
for($i=0; $i -lt $response.posts.Count; $i++) { 
    Write-Host "=== POST $($i+1) ===" -ForegroundColor Cyan 
    Write-Host $response.posts[$i].content -ForegroundColor White 
    Write-Host "" 
}
```

### Passo 3: Pressione ENTER
- Os posts aparecerão formatados
- Copie e cole na NewPost-IA

---

## 🔥 MÉTODO 2: Direto no PowerShell (Uma linha)

### Copie e cole este comando:

```
Invoke-RestMethod -Uri "https://paddle-billing-subscription-starter-pank-2.vercel.app/api/ready-posts" -Method POST -Body '{"category":"tecnologia","count":3}' -ContentType "application/json" | Select-Object -ExpandProperty posts | ForEach-Object { $_.content; Write-Host "" }
```

---

## 🔥 MÉTODO 3: Mudar Categoria

### Para posts de BRASIL:
```
Invoke-RestMethod -Uri "https://paddle-billing-subscription-starter-pank-2.vercel.app/api/ready-posts" -Method POST -Body '{"category":"brasil","count":3}' -ContentType "application/json"
```

### Para posts de ECONOMIA:
```
Invoke-RestMethod -Uri "https://paddle-billing-subscription-starter-pank-2.vercel.app/api/ready-posts" -Method POST -Body '{"category":"economia","count":3}' -ContentType "application/json"
```

---

## 🔥 MÉTODO 4: Acessar NewPost-IA

1. **Abra o navegador**
2. **Acesse:** https://plugpost-ai.lovable.app/
3. **Faça login** com suas credenciais
4. **Cole os posts** gerados

---

## 🎯 DICAS RÁPIDAS

### Mudar quantidade de posts:
- Mude `"count":3` para `"count":5` (gera 5 posts)
- Mude `"count":1` (gera 1 post)

### Categorias disponíveis:
- `"tecnologia"` - Tech e inovação
- `"brasil"` - Notícias nacionais
- `"economia"` - Finanças e mercado

### Exemplo completo:
```
Invoke-RestMethod -Uri "https://paddle-billing-subscription-starter-pank-2.vercel.app/api/ready-posts" -Method POST -Body '{"category":"tecnologia","count":5}' -ContentType "application/json"
```

---

## 🚀 AUTOMAÇÃO COMPLETA

### Criar um atalho no desktop:
1. Clique com o direito no desktop
2. Novo > Atalho
3. Cole: `powershell -Command "Invoke-RestMethod -Uri 'https://paddle-billing-subscription-starter-pank-2.vercel.app/api/ready-posts' -Method POST -Body '{\"category\":\"tecnologia\",\"count\":3}' -ContentType 'application/json' | Select-Object -ExpandProperty posts | ForEach-Object { $_.content; Write-Host '' }"`
4. Nomeie: "Gerar Posts NewPost-IA"
5. Clique duas vezes para usar!

---

## 📱 RESULTADO ESPERADO

Os posts aparecerão assim:
```
💻🚀📱 Webcam 4K em oferta: modelo é ideal para aulas à distância...

🔗 Leia mais: https://olhardigital.com.br/... #tecnologia #inovação

💻🚀📱 O estudo da NASA que mudou a forma de purificar o ar...

🔗 Leia mais: https://olhardigital.com.br/... #tecnologia #inovação
```

**Pronto! Agora é só copiar e colar na NewPost-IA! 🎯**
