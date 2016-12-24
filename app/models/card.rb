class Card < ApplicationRecord
  belongs_to :deck

  def self.to_csv
    CSV.generate(headers: true) do |csv|
     
      csv << ["question","answer","deck"]

      all.each do |card|
        csv << [card.question, card.answer, Deck.find(card.deck_id).name]
      end

    end 
  end


end