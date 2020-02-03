Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  namespace :admin do 
  	resources :stats, only: [:index]
  	resources :authors, only: [:new, :destroy, :create]
  	get 'comments/moderate' => 'comments#moderate'
  end
  root 'posts#index'
end
