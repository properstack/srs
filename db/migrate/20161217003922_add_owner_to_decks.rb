class AddOwnerToDecks < ActiveRecord::Migration[5.0]
  def change
    add_column :decks, :owner, :integer
  end
end
