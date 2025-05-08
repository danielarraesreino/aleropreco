#!/usr/bin/env bash
# setup_aleropreco.sh
# Script simplificado para subir seu projeto AleroPreco ao GitHub usando SSH
# Salve em ~/aleropreco/setup_aleropreco.sh e execute:
#   chmod +x setup_aleropreco.sh
#   ./setup_aleropreco.sh

set -euo pipefail

# 1. Vá para a pasta do projeto
cd "${HOME}/aleropreco"

echo "1) Iniciar ou reiniciar o repo Git local"
git init

# 2) Certifique-se de ter adicionado sua chave SSH no GitHub (via settings/ssh)
echo "2) Certifique-se de ter adicionado ~/.ssh/id_ed25519.pub no GitHub"

# 3) Adicionar remote por SSH (substitui origin existente)
echo "3) Configurar remote SSH"
git remote remove origin 2>/dev/null || true
git remote add origin git@github.com:danielarraesreino/aleropreco.git

# 4) Fazer pull para alinhar o histórico (fast-forward)
echo "4) Alinhar com remoto"
git fetch origin main
git checkout -B main origin/main

# 5) Ajustar arquivos (.gitignore, requirements, .env.example)
echo "5) Atualizar arquivos de configuração"
cat > .gitignore << 'EOF'
__pycache__/
*.pyc
*.db
.env
.flaskenv
instance/
.vscode/
*.sqlite3
venv/
EOF

# 2. Gerar (ou reutilizar) sua chave SSH sem prompt
ssh-keygen -t ed25519 -C "coletivoaruatemvoz@gmail.com" -f ~/.ssh/id_ed25519 -N "" || true

# 3. Remover remotes antigos e adicionar o remote via SSH
git init
git remote remove origin 2>/dev/null || true
git remote add origin git@github.com:danielarraesreino/aleropreco.git

# 4. Refatorar requirements.txt mantendo backup
mv requirements.txt requirements.full.txt 2>/dev/null || true
<<<<<<< HEAD
=======
# 5. Atualizar .gitignore e .env.example com dados reais
cat > .gitignore << 'EOF'
__pycache__/
*.pyc
*.db
.env
.flaskenv
instance/
.vscode/
*.sqlite3
EOF

>>>>>>> Inicialização do projeto AleroPreço
cat > .env.example << 'EOF'
SECRET_KEY='another_super_secret_alerocusto_key_!@#$%'
DATABASE_URL='sqlite:///alerocusto.db'
EOF

# 6) Commit das alterações locais
echo "6) Commit das mudanças"
git add .
git commit -m "Setup .gitignore, requirements e .env.example"

git branch -M main
git push -u origin main

echo "✓ Projeto AleroPreco disponível em git@github.com:danielarraesreino/aleropreco.git"
