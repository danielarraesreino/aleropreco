from flask import Blueprint, render_template

receitas_bp = Blueprint('receitas', __name__, url_prefix='/receitas')

@receitas_bp.route('/')
def lista_receitas():
    receitas = [
        {'id': 1, 'nome': 'Feijoada', 'custo': 120.0},
        {'id': 2, 'nome': 'Moqueca', 'custo': 180.0},
    ]
    return render_template('receitas/lista.html', receitas=receitas)
