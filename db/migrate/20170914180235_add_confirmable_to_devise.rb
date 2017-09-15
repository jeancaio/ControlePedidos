class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  def up
    add_column :usuarios, :confirmation_token, :string
    add_column :usuarios, :confirmed_at, :datetime
    add_column :usuarios, :confirmation_sent_at, :datetime

    add_index :usuarios, :confirmation_token, unique: true

    Usuario.all.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :usuarios, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
