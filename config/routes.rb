Spree::Core::Engine.add_routes do
  # Add your extension routes here
  # resources :tickets 

  namespace :admin do
    resources :tickets
  end
end
