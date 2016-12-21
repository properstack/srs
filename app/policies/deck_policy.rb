class DeckPolicy < ApplicationPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @record.user == @user
  end

  def edit?
    @record.user == @user
  end

  def create?
    @record.user == @user 
  end

end
