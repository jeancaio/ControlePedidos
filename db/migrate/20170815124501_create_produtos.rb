class CreateProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.decimal :preco
      t.boolean :ativo
      t.integer :estoque

      t.timestamps
    end
  end
end
