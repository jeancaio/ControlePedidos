class Pedido < ApplicationRecord
  has_many :itens_pedido, dependent: :destroy
  has_many :produtos, through: :itens_pedido, source: :produto

  validate :valida_quantidade_produto

  belongs_to :cliente

  accepts_nested_attributes_for :itens_pedido, reject_if: :all_blank, allow_destroy: true

  scope :id_eq_or_cliente_nome_or_cliente_cpf_cont, ->(query) do
    id = query.to_i

    if id > 0
      where(id: id)
    else
      query = "%#{query.to_s.upcase}%"
      joins(:cliente).where("#{Cliente.table_name}.nome ILIKE '#{query}'")
    end
  end

  def self.ransackable_scopes(_auth_object = nil)
    [:id_eq_or_cliente_nome_or_cliente_cpf_cont]
  end

  def liberado?
    status
  end

  def soma_pedido
    itens_pedido.inject(0) { |sum, p| sum + p.subtotal }
  end

  def atualizaEstoqueDiminui
    produtos.each do |produto|
      item_pedido = itens_pedido.find_by(produto_id: produto)
      produto.estoque -= item_pedido.quantidade
      produto.save
    end
  end

  def atualizaEstoqueAumenta
    produtos.each do |produto|
      item_pedido = itens_pedido.find_by(produto_id: produto)
      produto.estoque += item_pedido.quantidade
      produto.save
    end
  end

  private

  def valida_quantidade_produto
    errors.add(:base, 'Pedido deve ter ao menos um item') if itens_pedido.empty?
  end
end
