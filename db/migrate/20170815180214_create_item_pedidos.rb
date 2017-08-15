class CreateItemPedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :item_pedidos do |t|
      t.references :produto, foreign_key: true
      t.references :pedido, foreign_key: true

      t.timestamps
    end
  end
end
