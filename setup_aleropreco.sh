#!/usr/bin/env bash
# setup_aleropreco.sh
# Script simplificado para subir seu projeto AleroPreço ao GitHub usando SSH
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

cat > .env.example << 'EOF'
SECRET_KEY='another_super_secret_alerocusto_key_!@#$%'
DATABASE_URL='sqlite:///alerocusto.db'
EOF

# 6) Commit das alterações locais
echo "6) Commit das mudanças"
git add .
git commit -m "Setup .gitignore, requirements e .env.example"

# 7) Push final para GitHub
echo "7) Enviando para GitHub"
git push -u origin main

echo "✓ Projeto AleroPreço disponível em git@github.com:danielarraesreino/aleropreco.git"

