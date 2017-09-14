class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  def up
    Usuario.all.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :usuarios, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
