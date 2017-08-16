class Produto < ApplicationRecord
  has_many :itens_pedido
  has_many :pedidos, through: :itens_pedido, source: :pedido

  validates :descricao, :preco, :estoque, presence: true
end
