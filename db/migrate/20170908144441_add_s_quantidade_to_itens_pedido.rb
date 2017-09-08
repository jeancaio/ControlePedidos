class AddSQuantidadeToItensPedido < ActiveRecord::Migration[5.1]
  def change
    add_column :itens_pedido, :quantidade, :integer, default: 1
  end
end
