Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'posts#index'

  # a custom path for my posts  action
  #get '/my_posts' => 'posts#my_posts', :as => :my_posts

  resources :posts do
    resources :comments
  end
end
