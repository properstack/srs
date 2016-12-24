class DecksController < ApplicationController
  before_action :set_deck, only: [:edit, :destroy, :update]
  before_action :authenticate_user!


  def upload
    Deck.upload(upload_params[:file], current_user)
    redirect_to :decks, notice: "Successfully uploaded CSV"
  end



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

  def download
    @cards = Card.includes(:deck).where(decks: {user_id: current_user.id})
    respond_to do |format|
      format.csv { send_data @cards.to_csv }
    end
  end


  def create
    @deck = Deck.new(deck_params)
    authorize @deck
    respond_to do |format|
      if @deck.save
        format.html {redirect_to edit_decks_path(@deck), notice: "New deck created"}
      end
    end
  end


  def destroy
    authorize @deck
  	@deck.destroy
  	respond_to do |format|
      format.html { redirect_to :decks, notice: "Succesfully deleted deck." }
  	end
  end


  private
    def deck_params
      params.require(:deck).permit(:name, :user_id, :file)
    end

    def upload_params
      params.permit(:name, :user_id, :file)
    end
    
    def set_deck
      @deck = Deck.find(params[:id])
    end

end