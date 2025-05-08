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
SSH_KEY="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
  ssh-keygen -t ed25519 -C "coletivoaruatemvoz@gmail.com" -f "$SSH_KEY" -N ""
  echo "Chave SSH gerada: $SSH_KEY"
else
  echo "Chave SSH já existe: $SSH_KEY"
fi

# 3. Adicionar GitHub aos known_hosts para evitar prompt
mkdir -p "$HOME/.ssh"
ssh-keyscan github.com >> "$HOME/.ssh/known_hosts" 2>/dev/null || true

# 4. Configurar remote Git via SSH
git init
if git remote | grep -q origin; then
  git remote remove origin
fi
git remote add origin git@github.com:danielarraesreino/aleropreco.git

# 5. Atualizar arquivos de configuração
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

# 6. Refatorar requirements.txt mantendo backup
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

# 7. Atualizar .env.example
cat > .env.example << 'EOF'
SECRET_KEY='another_super_secret_alerocusto_key_!@#$%'
DATABASE_URL='sqlite:///alerocusto.db'
EOF

# 8. Commit das alterações locais
echo "Commitando mudanças locais..."
git add .
git commit -m "Setup .gitignore, requirements e .env.example"

git branch -M main
git push -u origin main

echo "✓ Projeto AleroPreco disponível em git@github.com:danielarraesreino/aleropreco.git"

# setup_aleropreco.sh
<<<<<<< HEAD
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
# Use este script para configurar SSH e subir o projeto AleroPreco no GitHub
# Passos:
# 1. Salve este conteúdo em ~/aleropreco/setup_aleropreco.sh
# 2. Execute:
#      chmod +x ~/aleropreco/setup_aleropreco.sh
#      ~/aleropreco/setup_aleropreco.sh
# 3. Aguarde a conclusão.
=======
# Use este script para configurar SSH, sincronizar e subir o projeto AleroPreco no GitHub
# Salve em ~/aleropreco/setup_aleropreco.sh e execute:
#   chmod +x setup_aleropreco.sh
#   ./setup_aleropreco.sh
>>>>>>> Inicialização do projeto AleroPreco

set -euo pipefail

# 1. Acesse seu projeto
PROJECT_DIR="${HOME}/aleropreco"
cd "$PROJECT_DIR" || { echo "Erro: pasta $PROJECT_DIR não encontrada"; exit 1; }

echo "[1/9] Gerenciando chave SSH..."
SSH_KEY="${HOME}/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
  ssh-keygen -t ed25519 -C "coletivoaruatemvoz@gmail.com" -f "$SSH_KEY" -N ""
  echo "Chave SSH gerada: $SSH_KEY"
else
  echo "Chave SSH já existe: $SSH_KEY"
fi
<<<<<<< HEAD
>>>>>>> Inicialização do projeto AleroPreco
=======
# Ajustar permissões da chave
chmod 600 "$SSH_KEY"
>>>>>>> Inicialização do projeto AleroPreco

# 2. Iniciar ssh-agent e adicionar chave
echo "[2/9] Iniciando ssh-agent e adicionando chave..."
eval "$(ssh-agent -s)"
ssh-add "$SSH_KEY"

# 3. Adicionar GitHub aos known_hosts para evitar prompt
echo "[3/9] Adicionando github.com aos known_hosts..."
mkdir -p "${HOME}/.ssh"
ssh-keyscan github.com >> "${HOME}/.ssh/known_hosts" 2>/dev/null || true

# 4. Configurar remote Git via SSH
echo "[4/9] Configurando remote Git..."
git init
<<<<<<< HEAD
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
=======
>>>>>>> Inicialização do projeto AleroPreco
if git remote | grep -q origin; then
  git remote remove origin
fi
git remote add origin git@github.com:danielarraesreino/aleropreco.git

# 5. Sincronizar com remoto (pull --rebase)
echo "[5/9] Sincronizando com remoto..."
git fetch origin main || true
if git show-ref --verify --quiet refs/remotes/origin/main; then
  git pull --rebase origin main || true
fi

# 6. Refatorar requirements.txt
echo "[6/9] Atualizando requirements.txt..."
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

<<<<<<< HEAD
<<<<<<< HEAD
# 5. Atualizar .gitignore e .env.example
echo "[5/7] Atualizando .gitignore e .env.example..."
>>>>>>> Inicialização do projeto AleroPreco
=======
# 6. Atualizar .gitignore e .env.example
echo "[6/8] Atualizando .gitignore e .env.example..."
>>>>>>> Inicialização do projeto AleroPreco
=======
# 7. Atualizar .gitignore e .env.example
echo "[7/9] Atualizando .gitignore e .env.example..."
>>>>>>> Inicialização do projeto AleroPreco
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

>>>>>>> Inicialização do projeto AleroPreco
cat > .env.example << 'EOF'
SECRET_KEY='another_super_secret_alerocusto_key_!@#$%'
DATABASE_URL='sqlite:///alerocusto.db'
EOF

<<<<<<< HEAD
<<<<<<< HEAD
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
=======
# 7. Commit e push
echo "[7/8] Commitando e enviando ao GitHub..."
>>>>>>> Inicialização do projeto AleroPreco
=======
# 8. Commit e push
echo "[8/9] Commitando e enviando ao GitHub..."
>>>>>>> Inicialização do projeto AleroPreco
git add .
# commit only if changes exist
git diff --cached --quiet || git commit -m "Inicialização do projeto AleroPreco"
git branch -M main
git push -u origin main

# 9. Concluir
echo "[9/9] Concluído! Repositório disponível: git@github.com:danielarraesreino/aleropreco.git"

>>>>>>> Inicialização do projeto AleroPreco
