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


## Por quê?
Porque controlar custos é mais que uma planilha: é um estado de espírito. É saber que cada ingrediente tem uma história, um preço e um impacto no seu negócio. O AleroPreco nasceu da busca pelo equilíbrio entre sabor e sustentabilidade financeira.

---

## Instalação

1. Clone este repositório
2. Instale as dependências:
   ```bash
   pip install -r requirements.txt
   ```
3. Configure o ambiente (crie um arquivo `.env` se necessário)
4. Execute as migrations:
   ```bash
   flask db upgrade
   ```
5. Rode o servidor:
   ```bash
   flask run --debug
   ```

---

## Funcionalidades
- Cadastro e gerenciamento de produtos, fornecedores, receitas e compras
- Cálculo automático de custos
- Dashboard com visão geral
- Templates modernos e responsivos
- Estrutura pronta para uploads, leitura de QR Code, scraping de preços e autenticação

---

## Onboarding rápido
1. Acesse a home e navegue pelo menu principal
2. Cadastre produtos, fornecedores, receitas e compras
3. Visualize o dashboard para acompanhar custos
4. Use o menu global para acessar qualquer funcionalidade

---

## Prints e exemplos

> **Home:**
>
> ![Home](docs/print-home.png)
>
> **Produtos:**
>
> ![Produtos](docs/print-produtos.png)

---

## Fluxo típico
1. Cadastre seus produtos e fornecedores
2. Lance uma compra vinculando produtos e fornecedores
3. Crie receitas e associe ingredientes
4. Veja os custos calculados automaticamente
5. Acompanhe tudo pelo dashboard

---

## Contribuindo
Pull requests são bem-vindos! Para grandes mudanças, abra uma issue antes.

---

## Licença
MIT
