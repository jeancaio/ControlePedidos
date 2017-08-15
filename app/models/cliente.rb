class Cliente < ApplicationRecord
  validates :nome, :cpf, :endereco, :cidade, :uf, :fone, presence: true
end
