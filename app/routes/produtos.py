from flask import Blueprint, render_template, request, redirect, url_for, flash
from app import db
from app.models.produto import Produto

produtos_bp = Blueprint('produtos', __name__, url_prefix='/produtos')

@produtos_bp.route('/')
def lista_produtos():
    produtos = Produto.query.all()
    return render_template('produtos/lista.html', produtos=produtos)

@produtos_bp.route('/<int:produto_id>')
def detalhes_produto(produto_id):
    produto = Produto.query.get_or_404(produto_id)
    return render_template('produtos/detalhes.html', produto=produto)

@produtos_bp.route('/novo', methods=['GET', 'POST'])
def novo_produto():
    if request.method == 'POST':
        nome = request.form['nome']
        unidade = request.form['unidade']
        preco = float(request.form['preco'])
        produto = Produto(nome=nome, unidade=unidade, preco=preco)
        db.session.add(produto)
        db.session.commit()
        flash('Produto cadastrado com sucesso!', 'success')
        return redirect(url_for('produtos.lista_produtos'))
    return render_template('produtos/form.html', produto=None)

@produtos_bp.route('/<int:produto_id>/editar', methods=['GET', 'POST'])
def editar_produto(produto_id):
    produto = Produto.query.get_or_404(produto_id)
    if request.method == 'POST':
        produto.nome = request.form['nome']
        produto.unidade = request.form['unidade']
        produto.preco = float(request.form['preco'])
        db.session.commit()
        flash('Produto atualizado com sucesso!', 'success')
        return redirect(url_for('produtos.lista_produtos'))
    return render_template('produtos/form.html', produto=produto)

@produtos_bp.route('/<int:produto_id>/deletar', methods=['POST'])
def deletar_produto(produto_id):
    produto = Produto.query.get_or_404(produto_id)
    db.session.delete(produto)
    db.session.commit()
    flash('Produto removido com sucesso!', 'success')
    return redirect(url_for('produtos.lista_produtos'))
