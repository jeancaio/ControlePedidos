class Cliente < ApplicationRecord
  has_many :pedidos

  validates :nome, :cpf, :endereco, :cidade, :uf, :fone, presence: true

  def to_s
    "#{nome}"
  end
end
