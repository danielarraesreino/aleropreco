from flask import Blueprint, render_template, request, redirect, url_for, flash
import os

compras_bp = Blueprint('compras', __name__, url_prefix='/compras')

@compras_bp.route('/')
def lista_compras():
    compras = [
        {'id': 1, 'fornecedor': 'Fornecedor A', 'valor': 150.0},
        {'id': 2, 'fornecedor': 'Fornecedor B', 'valor': 320.5},
    ]
    return render_template('compras/lista.html', compras=compras)

@compras_bp.route('/importar-nota', methods=['GET', 'POST'])
def importar_nota():
    from app import db
    from app.models.fornecedor import Fornecedor
    from app.models.produto import Produto
    from app.models.compra import Compra, ItemCompra
    import xml.etree.ElementTree as ET
    import io

    if request.method == 'POST':
        file = request.files.get('nota_xml')
        if file and file.filename.endswith('.xml'):
            try:
                xml_content = file.read()
                tree = ET.parse(io.BytesIO(xml_content))
                root = tree.getroot()

                # --- EXTRAI DADOS DO FORNECEDOR (ajuste conforme XML real) ---
                emit = root.find('.//emit')
                nome_fornecedor = emit.find('xNome').text if emit is not None else 'Fornecedor Desconhecido'
                cnpj_fornecedor = emit.find('CNPJ').text if emit is not None else '00000000000000'

                fornecedor = Fornecedor.query.filter_by(cnpj=cnpj_fornecedor).first()
                if not fornecedor:
                    fornecedor = Fornecedor(nome=nome_fornecedor, cnpj=cnpj_fornecedor)
                    db.session.add(fornecedor)
                    db.session.commit()

                # --- CRIA COMPRA ---
                compra = Compra(fornecedor_id=fornecedor.id, valor=0.0)
                db.session.add(compra)
                db.session.commit()

                total_compra = 0.0
                # --- EXTRAI ITENS DA COMPRA ---
                for det in root.findall('.//det'):
                    prod = det.find('prod')
                    if prod is None:
                        continue
                    nome_produto = prod.find('xProd').text
                    unidade = prod.find('uCom').text
                    quantidade = float(prod.find('qCom').text)
                    preco_unitario = float(prod.find('vUnCom').text)

                    produto = Produto.query.filter_by(nome=nome_produto, unidade=unidade).first()
                    if not produto:
                        produto = Produto(nome=nome_produto, unidade=unidade, preco=preco_unitario)
                        db.session.add(produto)
                        db.session.commit()
                    item = ItemCompra(compra_id=compra.id, produto_id=produto.id, quantidade=quantidade, preco_unitario=preco_unitario)
                    db.session.add(item)
                    total_compra += quantidade * preco_unitario
                compra.valor = total_compra
                db.session.commit()
                flash('Nota fiscal importada com sucesso!', 'success')
                return redirect(url_for('compras.lista_compras'))
            except Exception as e:
                flash(f'Erro ao processar XML: {str(e)}', 'danger')
        else:
            flash('Por favor, envie um arquivo XML válido.', 'danger')
    return render_template('compras/importar_nota.html')

@compras_bp.route('/<int:compra_id>')
def detalhes_compra(compra_id):
    # Exemplo de dados mockados
    compra = {'id': compra_id, 'fornecedor': 'Fornecedor A', 'valor': 150.0}
    return render_template('compras/detalhes.html', compra=compra)
