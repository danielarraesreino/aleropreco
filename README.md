# aleropreco
Sistema de controle de custos e compras para restaurantes - AleroPreco

> “Conhece-te a ti mesmo... e aos custos do teu restaurante.”  
> — Sócrates, se tivesse um food truck

## O que é o AleroPreco?

AleroPreco é um sistema de controle de custos para restaurantes, bares e cozinhas filosóficas. Ele te ajuda a entender para onde vai cada centavo — porque no final, a margem de lucro é mais frágil que massa de pastel.

## Features

- Importação de notas fiscais (QR Code, XML, manual)
- Cadastro de produtos, fornecedores e receitas
- Cálculo automático de custo de pratos (com conversão de unidades)
- Monitoramento de preços e histórico de compras
- Geração de listas de compras inteligentes
- Dashboard Streamlit para visualização de dados (em breve)
- Upload de fotos de receitas (em breve)
- E aquela pitada de código bem temperado

## Stack Filosófico-Técnica

- **Backend:** Python + Flask
- **Banco de Dados:** SQLAlchemy + SQLite
- **Frontend:** HTML/CSS/Bootstrap + JavaScript
- **Imagem:** OpenCV + pyzbar
- **Web Scraping:** BeautifulSoup
- **Dashboard:** Streamlit

## Por quê?

Porque controlar custos é mais que uma planilha: é um estado de espírito. É saber que cada ingrediente tem uma história, um preço e um impacto no seu negócio. O AleroPreco nasceu da busca pelo equilíbrio entre sabor e sustentabilidade financeira.

## Instalação

```bash
git clone git@github.com:danielarraesreino/aleropreco.git
cd aleropreco
./setup_aleropreco.sh
# Crie seu .env a partir do .env.example
# Ative o virtualenv e rode:
flask db upgrade
flask run
```

## Estrutura Zen

```
aleropreco/
├── app/
│   ├── models/
│   ├── templates/
│   ├── static/
│   └── ...
├── migrations/
├── requirements.txt
├── setup_aleropreco.sh
└── README.md  # <- você está aqui
```

## Contribuindo

Pull requests são bem-vindos! Só não esqueça de filosofar nos commits.

## Licença

MIT. Use, abuse, mas não esqueça de dar crédito ao cozinheiro.
