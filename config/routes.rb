Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
  resources :lists do
    resources :bookmarks, only: %i[new create destroy]
  end

  resources :moviebookmarks, only: :destroy
end
