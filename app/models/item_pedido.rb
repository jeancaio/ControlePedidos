class ItemPedido < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido

  validates :produto_id, presence: true
  #  validates_numericality_of :quantidade, greater_than0
end
