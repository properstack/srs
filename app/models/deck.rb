class Deck < ApplicationRecord
  def self.upload(file, current_user)
    CSV.foreach(file.path, headers: true) do |row|
      if Deck.where(name: row["deck"], user_id:current_user.id).exists?
        deck = Deck.where({name: row["deck"], user_id:current_user.id}).first
      else
        deck = Deck.create(name: row["deck"], user_id:current_user.id)
      end
      Card.create(row.to_hash.except("deck").update("deck_id" => deck.id))
    end
  end

  has_many :cards
  belongs_to :user
end