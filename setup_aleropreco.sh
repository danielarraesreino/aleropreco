#!/usr/bin/env bash
# setup_aleropreco.sh
# Script simplificado para subir seu projeto AleroPreco ao GitHub usando SSH
# Salve em ~/aleropreco/setup_aleropreco.sh e execute:
#   chmod +x setup_aleropreco.sh
#   ./setup_aleropreco.sh

set -euo pipefail

# 1. Vá para a pasta do projeto
cd "${HOME}/aleropreco" || { echo "Erro: pasta ~/aleropreco não encontrada"; exit 1; }

# 2. Gerar (ou reutilizar) sua chave SSH sem prompt
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
=======
# Use este script para configurar SSH e subir o projeto AleroPreço no GitHub
# Passos:
# 1. Salve este conteúdo em ~/aleropreco/setup_aleropreco.sh
# 2. Execute:
#      chmod +x ~/aleropreco/setup_aleropreco.sh
#      ~/aleropreco/setup_aleropreco.sh
# 3. Aguarde a conclusão.

set -euo pipefail

# 1. Acesse seu projeto
PROJECT_DIR=~/aleropreco
cd "$PROJECT_DIR" || { echo "Erro: pasta $PROJECT_DIR não encontrada"; exit 1; }

echo "[1/7] Gerenciando chave SSH..."
SSH_KEY="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
  ssh-keygen -t ed25519 -C "coletivoaruatemvoz@gmail.com" -f "$SSH_KEY" -N ""
  echo "Chave SSH gerada: $SSH_KEY"
else
  echo "Chave SSH já existe: $SSH_KEY"
fi
>>>>>>> Inicialização do projeto AleroPreço

# 2. Adicionar GitHub aos known_hosts para evitar prompt
echo "[2/7] Adicionando github.com aos known_hosts..."
mkdir -p "$HOME/.ssh"
ssh-keyscan github.com >> "$HOME/.ssh/known_hosts" 2>/dev/null || true

# 3. Configurar remote Git via SSH
echo "[3/7] Configurando remote Git..."
git init
<<<<<<< HEAD
git remote remove origin 2>/dev/null || true
git remote add origin git@github.com:danielarraesreino/aleropreco.git

# 4. Refatorar requirements.txt mantendo backup
mv requirements.txt requirements.full.txt 2>/dev/null || true
<<<<<<< HEAD
=======
# 5. Atualizar .gitignore e .env.example com dados reais
=======
ngit_remote=$(git remote)
if git remote | grep -q origin; then
  git remote remove origin
fi
git remote add origin git@github.com:danielarraesreino/aleropreco.git

# 4. Refatorar requirements.txt
echo "[4/7] Atualizando requirements.txt..."
if [ -f requirements.txt ]; then
  mv requirements.txt requirements.full.txt
fi
cat > requirements.txt << 'EOF'
flask==3.0.3
flask-sqlalchemy==3.1.1
flask-migrate==4.1.0
flask-login==0.6.3
flask-wtf==1.2.1
email-validator==2.2.0
python-dotenv==1.0.1
sqlalchemy==2.0.40
wtforms==3.1.2
gunicorn==21.2.0
EOF

# 5. Atualizar .gitignore e .env.example
echo "[5/7] Atualizando .gitignore e .env.example..."
>>>>>>> Inicialização do projeto AleroPreço
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

>>>>>>> Inicialização do projeto AleroPreço
cat > .env.example << 'EOF'
SECRET_KEY='another_super_secret_alerocusto_key_!@#$%'
DATABASE_URL='sqlite:///alerocusto.db'
EOF

<<<<<<< HEAD
# 6) Commit das alterações locais
echo "6) Commit das mudanças"
git add .
git commit -m "Setup .gitignore, requirements e .env.example"

git branch -M main
git push -u origin main

echo "✓ Projeto AleroPreco disponível em git@github.com:danielarraesreino/aleropreco.git"
=======
# 6. Commit e push inicial
echo "[6/7] Commitando e enviando ao GitHub..."
git add .
git commit -m "Inicialização do projeto AleroPreço" || true
git branch -M main
git push -u origin main

# 7. Concluir
echo "[7/7] Concluído! Repositório disponível: git@github.com:danielarraesreino/aleropreco.git"

>>>>>>> Inicialização do projeto AleroPreço
