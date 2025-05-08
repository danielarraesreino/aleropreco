from flask import Blueprint, render_template, request, redirect, url_for

fornecedores_bp = Blueprint('fornecedores', __name__, url_prefix='/fornecedores')

from flask import Blueprint, render_template, request, redirect, url_for, flash
from app import db
from app.models.fornecedor import Fornecedor

fornecedores_bp = Blueprint('fornecedores', __name__, url_prefix='/fornecedores')

@fornecedores_bp.route('/')
def lista_fornecedores():
    fornecedores = Fornecedor.query.all()
    return render_template('fornecedores/lista.html', fornecedores=fornecedores)

@fornecedores_bp.route('/<int:fornecedor_id>')
def detalhes_fornecedor(fornecedor_id):
    fornecedor = Fornecedor.query.get_or_404(fornecedor_id)
    return render_template('fornecedores/detalhes.html', fornecedor=fornecedor)

@fornecedores_bp.route('/novo', methods=['GET', 'POST'])
def novo_fornecedor():
    if request.method == 'POST':
        nome = request.form['nome']
        cnpj = request.form['cnpj']
        fornecedor = Fornecedor(nome=nome, cnpj=cnpj)
        db.session.add(fornecedor)
        db.session.commit()
        flash('Fornecedor cadastrado com sucesso!', 'success')
        return redirect(url_for('fornecedores.lista_fornecedores'))
    return render_template('fornecedores/form.html', fornecedor=None)

@fornecedores_bp.route('/<int:fornecedor_id>/editar', methods=['GET', 'POST'])
def editar_fornecedor(fornecedor_id):
    fornecedor = Fornecedor.query.get_or_404(fornecedor_id)
    if request.method == 'POST':
        fornecedor.nome = request.form['nome']
        fornecedor.cnpj = request.form['cnpj']
        db.session.commit()
        flash('Fornecedor atualizado com sucesso!', 'success')
        return redirect(url_for('fornecedores.lista_fornecedores'))
    return render_template('fornecedores/form.html', fornecedor=fornecedor)
