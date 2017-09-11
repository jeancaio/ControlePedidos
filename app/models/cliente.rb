class Cliente < ApplicationRecord
  has_many :pedidos, dependent: :destroy

  validates :endereco, :cidade, presence: true
  validates :nome, presence: true, format: { with: /\A[a-zA-ZàáâãèéêìíóôõùúçÀÁÂĖÈÉÊÌÍÒÓÔÕÙÚÛÇ ]+\z/, message: 'apenas permite letras' }
  validates :uf, presence: true, length: { is: 2 }, format: { with: /\A[a-zA-Z]+\z/, message: 'apenas permite letras' }
  validates :cpf, presence: true, length: { is: 14 }, format: { with: /[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}/, message: 'apenas permite números' }
  validates :fone, presence: true, length: { in: 14..15 }, format: { with: /\([0-9]{2}\) [2-9][0-9]{3,4}\-[0-9*]{4}/, message: 'digite um número de telefone válido' }
  def to_s
    nome.to_s
  end
end
