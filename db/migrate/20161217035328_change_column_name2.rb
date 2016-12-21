class ChangeColumnName2 < ActiveRecord::Migration[5.0]
  def change
    rename_column :decks, :owner_id, :user_id
  end
end
