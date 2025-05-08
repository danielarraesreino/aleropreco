from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager
from flask_wtf.csrf import CSRFProtect
import os

# Instâncias globais (evita import circular)
db = SQLAlchemy()
migrate = Migrate()
login_manager = LoginManager()
csrf = CSRFProtect()

def create_app():
    app = Flask(__name__)

    # Configuração
    env_path = os.path.join(os.path.dirname(__file__), '..', '.env')
    if os.path.exists(env_path):
        from dotenv import load_dotenv
        load_dotenv(env_path)
    app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'dev_secret')
    app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL', 'sqlite:///alerocusto.db')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # Inicializa extensões
    db.init_app(app)
    migrate.init_app(app, db)
    login_manager.init_app(app)
    csrf.init_app(app)

    # Importa e registra blueprints
    try:
        from app.routes import main_bp
        app.register_blueprint(main_bp)
    except Exception:
        pass  # Blueprint opcional, não trava deploy
    try:
        from app.routes.compras import compras_bp
        app.register_blueprint(compras_bp)
    except Exception:
        pass
    # Adicione outros blueprints conforme necessário

    @app.route("/healthz")
    def healthz():
        return "ok"

    @app.route("/")
    def index():
        return "AleroPreco está no ar! 🚀"

    return app

# Para compatibilidade com gunicorn app:app
app = create_app()
