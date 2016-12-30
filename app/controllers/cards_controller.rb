class CardsController < ApplicationController
  before_action :set_card, only: [:destroy, :update, :update_rank]
  before_action :authenticate_user!


  def create
    @card = Card.new(card_params)
    authorize @card
    respond_to do |format|
      if @card.save
        format.html { redirect_to :back, notice: "Card was successfully saved" }
      else
        format.html { render :back }
      end
    end
  end


  def cheat
    @cards = Card.includes(:deck).where(decks: { user_id: current_user.id})
  end


  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to review_cards_path(@card.deck_id) }
      else
        format.html { render :back }
      end
    end
  end


  def review
    @card = Card.includes(:deck).where(deck_id: review_params[:deck_id], decks: {user_id: current_user.id}).order(:current_ranking).first
    authorize @card
  end


  def destroy
    @card.destroy
    respond_to do |format| 
      format.html{ redirect_to :back, notice: "Successfully deleted card." }
    end
  end


  private

    def card_params
      params.require(:card).permit(:question,:answer,:current_ranking,:deck_id)
    end

    def set_card
      @card = Card.find(params[:id])
    end

    def review_params
      params.permit(:question,:answer,:current_ranking,:deck_id)
    end


end