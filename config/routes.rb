Spree::Core::Engine.add_routes do
  # Add your extension routes here
  resources :tickets do
    member do
      post :conversations
    end
  end

  namespace :admin do
    resources :tickets do
      member do
        match :conversations, via: [:get, :post]
      end
    end
  end
end
