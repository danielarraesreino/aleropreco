from flask import Blueprint, render_template

compras_bp = Blueprint('compras', __name__, url_prefix='/compras')

@compras_bp.route('/')
def lista_compras():
    # Exemplo de dados mockados
    compras = [
        {'id': 1, 'fornecedor': 'Fornecedor A', 'valor': 150.0},
        {'id': 2, 'fornecedor': 'Fornecedor B', 'valor': 320.5},
    ]
    return render_template('compras/lista.html', compras=compras)

@compras_bp.route('/<int:compra_id>')
def detalhes_compra(compra_id):
    # Exemplo de dados mockados
    compra = {'id': compra_id, 'fornecedor': 'Fornecedor A', 'valor': 150.0}
    return render_template('compras/detalhes.html', compra=compra)
