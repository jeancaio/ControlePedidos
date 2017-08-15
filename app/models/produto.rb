class Produto < ApplicationRecord
  validates :descricao, :preco, :estoque, presence: true
  
end
