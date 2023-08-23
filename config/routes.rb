Rails.application.routes.draw do
  get 'reviews/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    # GET /restaurants/:id/reviews/new
    resources :reviews, only: [:new, :create]
    collection do
      # index customizado
      # /restaurants/qualquer_coisa
      # get "top"
      get :top
    end

    member do
      # show customizado
      # /restaurants/:id/chef
      get :chef
    end
  end
  # GET /reviews
  # resources: reviews
  resources :reviews, only: [:show, :edit, :destroy]
end
