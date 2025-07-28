# 🛡️ Linux Security Hardening Script

[![Shell Script](https://img.shields.io/badge/Shell-Bash-4EAA25.svg)](https://www.gnu.org/software/bash/)
[![Debian/Ubuntu](https://img.shields.io/badge/Platform-Debian%2FUbuntu-orange.svg)](https://www.debian.org/)

> **Automatize práticas essenciais de endurecimento de segurança em sistemas Linux baseados em Debian**

Este script realiza um **hardening básico de segurança** em sistemas Linux baseados em Debian (como Ubuntu), automatizando práticas de endurecimento para reduzir significativamente a superfície de ataque de um servidor recém-instalado.

---

## 🎯 **Objetivo**

Implementar automaticamente configurações de segurança essenciais que transformam um sistema Linux padrão em um ambiente mais resistente a ataques, seguindo as melhores práticas de segurança da indústria.

---

## 🚀 **Instalação e Uso**

### ⚠️ **IMPORTANTE: Execute como sudo/root**

```bash
# Clone o repositório
git clone https://github.com/pedrosilvaevangelista/hardening_script-linux.git
cd hardening_script-linux

# Torne o script executável
chmod +x hardening_script-linux.sh

# Execute o script
sudo ./hardening_script-linux.sh
```

---

## 🔧 **Funcionalidades**

### 🔄 **Atualização do Sistema**
- Atualiza todos os pacotes e correções de segurança
- Garante que o sistema esteja com as últimas patches

### 👤 **Gerenciamento de Usuários**
- **Cria usuário administrativo** (`admin`) com privilégios sudo
- **Desabilita login root via SSH** por segurança
- Configura senha inicial: `lab123` (⚠️ **altere imediatamente**)

### 🔐 **Endurecimento SSH**
```bash
✅ Backup automático da configuração original
✅ Força protocolo SSHv2 apenas
✅ Proíbe login root direto
✅ Desabilita senhas vazias
✅ Desativa X11 e TCP Forwarding
✅ Banner de aviso legal
```

### 🛡️ **Proteção contra Ataques**
- **Fail2Ban**: Proteção automática contra brute force
- **Firewall UFW** (opcional): Política padrão restritiva
- **Hardening de kernel**: Proteções contra diversos tipos de ataque

### 🔒 **Política de Senhas Fortes**
Implementa via PAM:
- Mínimo **12 caracteres**
- Obrigatório: maiúsculas, minúsculas, números e símbolos
- Verificação de complexidade automática

### 🔧 **Configurações de Kernel**
```bash
🚫 Desabilita IP forwarding
🚫 Bloqueia redirects ICMP
🚫 Previne source routing
📊 Habilita logs de pacotes suspeitos
🛡️ Proteção contra SYN flood
🔒 Oculta ponteiros de kernel
```

### 📁 **Permissões de Arquivos**
- Ajusta permissões de arquivos críticos (`/etc/passwd`, `/etc/shadow`)
- Limita acesso a informações sensíveis do sistema

### 🔄 **Atualizações Automáticas**
- Configura `unattended-upgrades`
- Aplicação automática de patches de segurança
- Reduz janela de vulnerabilidade

---

## 📋 **Checklist Pós-Execução**

Após executar o script, seu sistema terá:

- ✅ Sistema completamente atualizado
- ✅ Login root SSH desabilitado
- ✅ Usuário administrativo criado
- ✅ SSH configurado com práticas seguras
- ✅ Fail2Ban ativo contra brute force
- ✅ Política de senhas fortes implementada
- ✅ Kernel endurecido contra ataques
- ✅ Atualizações automáticas de segurança
- ✅ Permissões de arquivos ajustadas
- ✅ Banner de aviso configurado

---

## ⚠️ **Avisos Importantes**

### 🔄 **Reinicialização Recomendada**
Após a execução, **reinicie o sistema** para garantir que todas as configurações sejam aplicadas corretamente.

### 🔑 **Altere a Senha Padrão**
O usuário `admin` é criado com senha `lab123`. **ALTERE IMEDIATAMENTE** por segurança:
```bash

sudo passwd admin
```

### 🧪 **Teste em Ambiente Controlado**
Sempre teste o script em um ambiente de desenvolvimento antes de aplicar em produção.

---

## 🔧 **Configurações Opcionais**

O script inclui seções comentadas para:

- **Firewall UFW**: Descomente para ativar firewall restritivo
- **Desabilitar IPv6**: Para ambientes que não utilizam IPv6

---

## 📞 **Suporte**

Encontrou algum problema ou tem sugestões? Abra uma issue no repositório!

<div align="center">

**🛡️ Mantenha seu sistema seguro! 🛡️**

</div>
