from flask import Flask, render_template
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

    @login_manager.user_loader
    def load_user(user_id):
        return None

    # Importa modelos para o Flask-Migrate
    from app.models.produto import Produto
    from app.models.fornecedor import Fornecedor
    from app.models.receita import Receita

    # Importa e registra blueprints
    # Registra blueprints restaurados
    from app.routes import main_bp
    from app.routes.compras import compras_bp
    from app.routes.receitas import receitas_bp
    from app.routes.produtos import produtos_bp
    from app.routes.fornecedores import fornecedores_bp
    from app.routes.dashboard import dashboard_bp
    app.register_blueprint(main_bp)
    app.register_blueprint(compras_bp)
    app.register_blueprint(receitas_bp)
    app.register_blueprint(produtos_bp)
    app.register_blueprint(fornecedores_bp)
    app.register_blueprint(dashboard_bp)

    @app.errorhandler(404)
    def not_found_error(error):
        return render_template('404.html'), 404

    @app.errorhandler(500)
    def internal_error(error):
        return render_template('500.html'), 500

    @app.route("/healthz")
    def healthz():
        return "ok"

    return app

# Para compatibilidade com gunicorn app:app
app = create_app()
