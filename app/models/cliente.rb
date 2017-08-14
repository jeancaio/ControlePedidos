class Cliente < ApplicationRecord
  validates_presence_of :nome, :cpf, :endereco, :cidade, :uf, :fone 
end
