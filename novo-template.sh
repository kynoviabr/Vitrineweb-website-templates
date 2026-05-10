#!/bin/bash
# novo-template.sh
# Uso: ./novo-template.sh "nome-do-template"
# Exemplo: ./novo-template.sh "restaurante"

set -e

if [ -z "$1" ]; then
  echo "❌ Informe o nome do template."
  echo "   Uso: ./novo-template.sh \"nome-do-template\""
  exit 1
fi

NOME=$(echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Descobre o próximo número
ULTIMO=$(ls -d template-*/ 2>/dev/null | grep -oP '\d+' | sort -n | tail -1)
PROXIMO=$(printf "%02d" $(( ${ULTIMO:-0} + 1 )))

PASTA="template-${PROXIMO}-${NOME}"

if [ -d "$PASTA" ]; then
  echo "❌ A pasta '$PASTA' já existe."
  exit 1
fi

mkdir -p "$PASTA"

# index.html
cat > "$PASTA/index.html" << EOF
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Template ${PROXIMO} — ${NOME^}</title>
  <link rel="stylesheet" href="../../_shared/css/base.css" />
  <link rel="stylesheet" href="style.css" />
</head>
<body>

  <!-- Seu HTML aqui -->
  <h1>Template ${PROXIMO} — ${NOME}</h1>

  <script type="module">
    import { animateOnScroll, initMobileMenu, initSmoothScroll } from '../../_shared/js/utils.js';
    import { initTemplate } from './script.js';

    animateOnScroll();
    initMobileMenu();
    initSmoothScroll();
    initTemplate();
  </script>
</body>
</html>
EOF

# style.css
cat > "$PASTA/style.css" << EOF
/* =========================================
   ${PASTA}/style.css
   ========================================= */

@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap');

:root {
  --color-primary: #111;
  --color-secondary: #fff;
  --color-accent: #0066ff;
  --font-heading: 'Inter', sans-serif;
  --font-body: 'Inter', sans-serif;
}

/* Seus estilos aqui */
EOF

# script.js
cat > "$PASTA/script.js" << EOF
// ${PASTA}/script.js

export function initTemplate() {
  console.log('Template ${PROXIMO} inicializado.');
}
EOF

# README.md
cat > "$PASTA/README.md" << EOF
# Template ${PROXIMO} — ${NOME^}

> **Categoria:**  
> **Ideal para:**  

## 📸 Preview

<!-- Adicione um screenshot aqui -->

## ✅ Seções incluídas

-

## 🎨 Personalização rápida

\`\`\`css
:root {
  --color-primary: #111;
  --color-accent:  #0066ff;
}
\`\`\`
EOF

echo ""
echo "✅ Template criado: $PASTA"
echo ""
echo "Próximos passos:"
echo "  1. Edite $PASTA/index.html"
echo "  2. Edite $PASTA/style.css"
echo "  3. Atualize o README.md do template"
echo "  4. Adicione na tabela do README.md raiz"
echo ""
