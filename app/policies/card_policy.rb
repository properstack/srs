class CardPolicy < ApplicationPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def review?
    @record.deck.user == @user
  end

  def update_rank?
    @record.deck.user == @user
  end

  def create?
    @record.deck.user == @user
  end

end
