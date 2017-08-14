class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :endereco
      t.string :cidade
      t.string :uf
      t.string :fone

      t.timestamps
    end
  end
end
