class Pedido < ApplicationRecord
  has_many :itens_pedido
  has_many :produtos, through: :itens_pedido, source: :produto

  belongs_to :cliente

  accepts_nested_attributes_for :itens_pedido, reject_if: :all_blank, allow_destroy: true
end
