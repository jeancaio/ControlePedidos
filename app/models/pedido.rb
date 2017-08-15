class Pedido < ApplicationRecord
  has_many :intem_pedido
  
  belongs_to :cliente
end
