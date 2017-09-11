class Produto < ApplicationRecord
  has_many :itens_pedido, dependent: :destroy
  has_many :pedidos, through: :itens_pedido, source: :pedido

  validates :descricao, :preco, :estoque, presence: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '50x50>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def to_s
    descricao.to_s
  end

  scope :id_eq_or_descricao_cont, ->(query) do
    id = query.to_i

    if id > 0
      where(id: id)
    else
      query = "%#{query.to_s.upcase}%"
      where "descricao ILIKE '#{query}'"
    end
  end

  def self.ransackable_scopes(_auth_object = nil)
    [:id_eq_or_descricao_cont]
  end
end
