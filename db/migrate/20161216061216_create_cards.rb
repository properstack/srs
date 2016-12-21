class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.text :question
      t.text :answer
      t.integer :seen
      t.integer :current_ranking
    end
  end
end
