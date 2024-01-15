Spree::Core::Engine.add_routes do
  # Add your extension routes here
  resources :tickets, except: [:edit] do
    member do
      post :conversations
    end
  end

  namespace :admin do
    resources :tickets, except: [:show] do
      member do
        match :conversations, via: [:get, :post]
      end
    end
  end
end
