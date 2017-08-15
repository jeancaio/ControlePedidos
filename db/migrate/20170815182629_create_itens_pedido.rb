class CreateItensPedido < ActiveRecord::Migration[5.1]
  def change
    create_table :itens_pedido do |t|
      t.references :produto, foreign_key: true
      t.references :pedido, foreign_key: true

      t.timestamps
    end
  end
end
