class ItemPedido < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido

  validates :produto_id, presence: true
  validates :quantidade, numericality: { greater_than_or_equal_to: 1 }

  def subtotal
    produto.preco * quantidade
  end
end
