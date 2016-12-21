class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :decks, :owner, :owner_id
  end
end
