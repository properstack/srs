class DecksController < ApplicationController
  before_action :set_deck, only: [:edit, :destroy, :update]
  before_action :authenticate_user!


  def index
  	@decks = current_user.decks
    @new_deck = Deck.new({user_id: current_user.id})
  end

  def edit
  	authorize @deck
  	@new_card = Card.new(deck_id:@deck.id)
  end

  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to :back }
      end
    end
  end

  def create
    @deck = Deck.new(deck_params)
    authorize @deck
    respond_to do |format|
      if @deck.save
        format.html {redirect_to :back, notice: "New deck created"}
      end
    end
  end


  def destroy
  	@deck.destroy
  	respond_to do |format|
      format.html { redirect_to :decks, notice: "Succesfully deleted deck." }
  	end
  end


  private
    def deck_params
      params.require(:deck).permit(:name, :user_id)
    end
    
    def set_deck
      @deck = Deck.find(params[:id])
    end

end