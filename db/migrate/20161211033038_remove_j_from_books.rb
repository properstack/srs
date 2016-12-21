class RemoveJFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :name, :string
    remove_column :books, :content, :text
  end
end
