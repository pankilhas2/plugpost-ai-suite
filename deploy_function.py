#!/usr/bin/env python3
"""
Deploy automático da Edge Function via API REST
Alternativa ao Supabase CLI
"""

import requests
import json
import os

# Configurações
PROJECT_REF = "ykswhzqdjoshjoaruhqs"
API_KEY = "sb_secret_kiKzSFZcF_j4aLkXU1aAAw_ILHfST7Q"
FUNCTION_NAME = "auto-generate"

def deploy_function():
    """Deploy da Edge Function via API"""
    
    # Ler o código da função
    with open('supabase/functions/auto-generate/index.ts', 'r', encoding='utf-8') as f:
        function_code = f.read()
    
    # Ler deno.json
    with open('supabase/functions/auto-generate/deno.json', 'r', encoding='utf-8') as f:
        deno_config = f.read()
    
    # URL da API do Supabase
    url = f"https://api.supabase.com/v1/projects/{PROJECT_REF}/functions"
    
    headers = {
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json"
    }
    
    # Payload para criar/atualizar função
    payload = {
        "name": FUNCTION_NAME,
        "verify_jwt": False,
        "import_map": deno_config,
        "entries": {
            "main": {
                "code": function_code,
                "runtime": "deno"
            }
        }
    }
    
    try:
        print(f"🚀 Deploy da função {FUNCTION_NAME}...")
        
        # Tentar criar ou atualizar
        response = requests.post(url, headers=headers, json=payload)
        
        if response.status_code == 200:
            print("✅ Função deployada com sucesso!")
            return True
        elif response.status_code == 409:
            # Função já existe, atualizar
            print("📝 Função já existe, atualizando...")
            update_url = f"{url}/{FUNCTION_NAME}"
            response = requests.put(update_url, headers=headers, json=payload)
            
            if response.status_code == 200:
                print("✅ Função atualizada com sucesso!")
                return True
        
        print(f"❌ Erro no deploy: {response.status_code}")
        print(f"Response: {response.text}")
        return False
        
    except Exception as e:
        print(f"❌ Erro: {e}")
        return False

def test_function():
    """Testar a função deployada"""
    
    url = f"https://{PROJECT_REF}.supabase.co/functions/v1/{FUNCTION_NAME}"
    headers = {
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json"
    }
    
    try:
        print(f"🧪 Testando função...")
        response = requests.post(url, headers=headers, json={})
        
        if response.status_code == 200:
            print("✅ Função testada com sucesso!")
            print(f"Response: {response.json()}")
            return True
        else:
            print(f"❌ Erro no teste: {response.status_code}")
            print(f"Response: {response.text}")
            return False
            
    except Exception as e:
        print(f"❌ Erro no teste: {e}")
        return False

if __name__ == "__main__":
    print("🚀 NEWPOST-IA - Deploy Automático")
    print("=" * 50)
    
    # Deploy
    if deploy_function():
        # Teste
        test_function()
        
        print("\n🎉 DEPLOY CONCLUÍDO!")
        print(f"📱 URL da função: https://{PROJECT_REF}.supabase.co/functions/v1/{FUNCTION_NAME}")
        print("⏰ GitHub Actions vai chamar esta função automaticamente!")
    else:
        print("\n❌ FALHA NO DEPLOY!")
        print("Verifique as credenciais e tente novamente.")
