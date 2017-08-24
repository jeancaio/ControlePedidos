class ItemPedido < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido

  validates :produto_id, presence: true
end
