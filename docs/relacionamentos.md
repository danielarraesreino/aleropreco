# Relacionamentos entre entidades do AleroPreco

## Diagrama Simplificado

```
Fornecedor 1---* Compra *---1 Produto
                 |
                 *
                 |
                *
              ItemCompra

Receita *---* Produto
```

## Descrição dos Relacionamentos

- **Fornecedor <-> Compra**: Um fornecedor pode ter várias compras. Cada compra pertence a um fornecedor.
- **Compra <-> ItemCompra <-> Produto**: Uma compra pode ter vários itens (ItemCompra), cada um referenciando um produto e quantidade/preço. Um produto pode aparecer em várias compras.
- **Receita <-> Produto**: Uma receita pode ter vários produtos (ingredientes) e um produto pode ser usado em várias receitas (relação muitos-para-muitos, implementada futuramente com uma tabela associativa `IngredienteReceita`).

## Exemplo de Fluxo
1. Cadastra-se um fornecedor.
2. Registra-se uma compra desse fornecedor, adicionando itens (produtos comprados, quantidades e preços).
3. Produtos comprados são usados em receitas, que terão seus custos calculados automaticamente.

---

## Próximos passos sugeridos
- Implementar tabela associativa `IngredienteReceita` para receitas.
- Adicionar métodos utilitários para calcular custo de receitas a partir dos produtos e compras.
- Validar integridade referencial via SQLAlchemy.
