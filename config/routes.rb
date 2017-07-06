Rails.application.routes.draw do

  get 'tags/_new'

  get 'comments/new'

  get 'comments/create'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  
  # Establish routes to reflect many-to-one relationship
  resources :users do
    resources :photos
  end

  resources :photos do
    resources :comments
    resources :tags
  end

end
