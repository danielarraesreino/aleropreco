from app import db

class Fornecedor(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(120), nullable=False)
    cnpj = db.Column(db.String(20), nullable=False, unique=True)

    def __repr__(self):
        return f'<Fornecedor {self.nome}>'
