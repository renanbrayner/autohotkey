# 🧰 AutoHotkey Keybind Setup

Sistema modular de atalhos com AutoHotkey v2, inspirado no meu fluxo de trabalho no linux com XMonad, focado em uso com teclado e arquitetura escalável.

---

## 📁 Estrutura de arquivos

```
AutoHotkey/
├── main.ahk               # Script principal, carrega tudo
├── config.ahk             # Define tecla modKey (atualmente: CapsLock)
├── mod_capslogic.ahk      # Desativa o comportamento original do CapsLock
├── lib/
│   ├── lock_volume.ahk    # Muta o sistema ao bloquear a tela
│   └── bind.ahk           # Funções utilitárias como bindMod, bindRun, etc.
└── shortcuts/
    ├── apps.ahk           # Atalhos para abrir aplicativos
    ├── browser.ahk        # Atalhos relacionados ao navegador
    └── windows.ahk        # Atalhos de gerenciamento de janelas
```

---

## ⚙️ Tecla principal (`modKey`)

Definida no arquivo `config.ahk`:

```ahk
getModKey() {
    return "CapsLock"
}
```

caso a tecla principal definida seja `CapsLock` o comportamento padrão da tecla será desativado e passado para o comando `Shift` + `Tab` pelo código no arquivo `~/mod_capslogic.ahk`

---

## ✅ Keybinds implementados

- `modKey + Enter` → Abre o Windows Terminal
- `modKey + W` → Abre o navegador padrão
- `modKey + Q` → Fecha a janela ativa
- `modKey + R` → Recarrega o script
- `modKey + H/L` → Move janela para metade esquerda/direita da tela (usando Snap)
- `Shift + Tab` → Alterna o CapsLock real (Caso a modKey seja CapsLock)

---

## 🆕 Como adicionar um novo atalho

1. Crie um novo arquivo `.ahk` dentro da pasta `shortcuts/` (ou edite um existente)
2. Use a função `bindMod(tecla, função)` ou outra função de bind como no exemplo abaixo:

```ahk
abrirGoogle(*) {
    Run("https://www.google.com")
}

bindMod("G", abrirGoogle)
```

3. Importe o arquivo novo em `main.ahk` utilizando `#Include "/caminho/do/arquivo.ahk"`

---

## 🤖 Funcionalidades Automáticas

O script AutoHotkey principal (`main.ahk`) também gerencia comportamentos automáticos do sistema, sem intervenção do usuário. As automações atuais incluem:

- 🔇 **Mutar volume ao bloquear a tela**  
  Sempre que o Windows for bloqueado (por exemplo, com `Win + L`), o áudio do sistema é automaticamente silenciado. O som é restaurado automaticamente ao desbloquear a sessão.

> Esta funcionalidade é implementada em [`lib/lock_volume.ahk`](lib/lock_volume.ahk) e utiliza notificações de sessão do Windows via `WTSRegisterSessionNotification`.

---

## ⚠️ Ainda não implementado

- `modKey + Número` → Mudar para workspace virtual (Windows não suporta nativamente sem DLL externa que falhou em testes)
- `modKey + Shift/Alt + tecla` → Suporte parcial: requer `HotIf`, não integrado a `bindMod` ainda

---

## 💡 Sugestões futuras

- Criar `bindModShift`, `bindModAlt`, etc. com `HotIf` globais
- Integração com [VirtualDesktop.ahk](https://github.com/Ciantic/VirtualDesktop)
- Script de emergência para encerrar/reiniciar o sistema de binds em caso de falha

---

## 🔧 Dependências e Inicialização Automática

### 📦 Requisitos

- [AutoHotkey v2](https://www.autohotkey.com/) instalado (necessário para rodar os scripts)
    - Baixe e instale a versão mais recente em: https://www.autohotkey.com/download/

### 🚀 Iniciar automaticamente com o Windows

1. Pressione `Win + R` e digite `shell:startup` para abrir a pasta de inicialização.
2. Crie um atalho para o arquivo `main.ahk` dentro dessa pasta:

```
"C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" "C:\Caminho\para\main.ahk"
```

Se você compilou o script com o AutoHotkey, basta criar um atalho para o `main.exe` gerado.

3. Pronto! O script será executado automaticamente ao iniciar o sistema.
