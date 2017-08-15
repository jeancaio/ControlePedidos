class Produto < ApplicationRecord
  has_many :intem_pedido

  validates :descricao, :preco, :estoque, presence: true

end
