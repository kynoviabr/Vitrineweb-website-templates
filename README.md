# 🎨 Templates de Sites

Vitrine de templates prontos para clientes escolherem e personalizarem.

## 📁 Estrutura

```
site-templates/
├── index.html              ← Vitrine para os clientes navegarem
├── novo-template.sh        ← Script para criar novo template
├── _shared/                ← Assets reutilizáveis entre templates
│   ├── css/base.css
│   └── js/utils.js
└── template-01-exemplo/    ← Cada template tem sua pasta
    ├── index.html
    ├── style.css
    ├── script.js
    └── README.md
```

## 🚀 Como adicionar um novo template

```bash
./novo-template.sh "nome-do-template"
```

Isso cria a pasta e os arquivos base automaticamente.

## 🌐 Preview local

Abra qualquer `index.html` direto no navegador, ou use uma extensão como **Live Server** no VS Code.

## 📋 Lista de templates

| # | Nome | Categoria | Preview |
|---|------|-----------|---------|
| 01 | Exemplo | - | [Ver](./template-01-exemplo/) |

> Atualize esta tabela sempre que adicionar um novo template.
