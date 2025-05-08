from app import db

class Receita(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(120), nullable=False)
    custo = db.Column(db.Float, nullable=False, default=0.0)

    def __repr__(self):
        return f'<Receita {self.nome}>'
