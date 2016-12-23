class PagesController < ApplicationController
  def show
    if valid_page?
    	if params[:page] == "home_page"
    		if current_user
          redirect_to :decks
        else
    		  render template: "pages/#{params[:page]}", layout: false
    	  end
    	else
        render template: "pages/#{params[:page]}"
      end
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end
end
