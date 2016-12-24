Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'pages#show', page: "home_page"


  post "cards/" => "cards#create", as: :cards
  delete "cards/:id/" => "cards#destroy", as: :cards_destroy
  patch "cards/:id/" => "cards#update", as: :update_cards
  get "cards/review" => "cards#review", as: :review_cards
  get "cards/cheat/" => "cards#cheat", as: :cheat


  get "decks/" => "decks#index", as: :decks
  get "decks/:id/edit/" => "decks#edit", as: :edit_decks #should this be singular?
  delete "decks/:id" => "decks#destroy", as: :destroy_decks
  patch "decks/:id" => "decks#update", as: :update_decks
  post "decks/" => "decks#create", as: nil #the name is repeated but its fine because the http verb is different, although it does not allow one to specify like this using as, it only allows one to indirectly do this, by daving the route be the same http://stackoverflow.com/questions/19189415/how-may-two-routes-with-different-http-request-types-share-the-same-name
  post "decks/upload" => "decks#upload", as: :upload_decks
  get "decks/download" => "decks#download", as: :download_csv

  get "pages/:page" => "pages#show", as: :pages

end
