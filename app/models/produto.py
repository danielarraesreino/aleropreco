from app import db

class Produto(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(120), nullable=False)
    unidade = db.Column(db.String(20), nullable=False)
    preco = db.Column(db.Float, nullable=False)

    def __repr__(self):
        return f'<Produto {self.nome}>'
