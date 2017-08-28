class AddStatusToPedidos < ActiveRecord::Migration[5.1]
  def change
    add_column :pedidos, :status, :boolean, default: false
  end
end
