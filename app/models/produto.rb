class Produto < ApplicationRecord
  has_many :itens_pedido, dependent: :destroy
  has_many :pedidos, through: :itens_pedido, source: :pedido

  validates :descricao, :preco, :estoque, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def to_s
    "#{descricao}"
  end
end
