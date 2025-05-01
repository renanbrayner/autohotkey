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

caso a tecla principal definida seja `CapsLock` o comportamento padrão da tecla será desativado e passado para o comando `Shift` + `Tab`

---

## ✅ Keybinds implementados

- `modKey + Enter` → Abre o Windows Terminal
- `modKey + W` → Abre o navegador padrão
- `modKey + Q` → Fecha a janela ativa
- `modKey + R` → Recarrega o script
- `modKey + H/L` → Move janela para metade esquerda/direita da tela (usando Snap)
- `Shift + Tab` → Alterna o CapsLock real (já que Caps foi desativado)

---

## 🆕 Como adicionar um novo atalho

1. Crie um novo arquivo `.ahk` dentro da pasta `shortcuts/` (ou edite um existente)
2. Use a função `bindMod(tecla, função)` como no exemplo abaixo:

```ahk
abrirGoogle(*) {
    Run("https://www.google.com")
}

bindMod("G", abrirGoogle)
```

3. Importe o arquivo novo em `main.ahk` utilizando `#Include "/caminho/do/arquivo.ahk"`

---

## ⚠️ Ainda não implementado

- `modKey + Número` → Mudar para workspace virtual (Windows não suporta nativamente sem DLL externa que falhou em testes)
- `modKey + Shift/Alt + tecla` → Suporte parcial: requer `HotIf`, não integrado a `bindMod` ainda

---

## 💡 Sugestões futuras

- Criar `bindModShift`, `bindModAlt`, etc. com `HotIf` globais
- Integração com [VirtualDesktop.ahk](https://github.com/Ciantic/VirtualDesktop)
- Script de emergência para encerrar/reiniciar o sistema de binds em caso de falha
