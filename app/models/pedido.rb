class Pedido < ApplicationRecord
  has_many :itens_pedido
  has_many :produtos, through: :itens_pedido, source: :produto


  belongs_to :cliente
end
