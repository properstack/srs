class WelcomesController < ApplicationController

  def index
  	current_user ? redirect_to(decks_url) : render(layout: false)
  end

end