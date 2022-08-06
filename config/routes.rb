Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  get "/home/about" => "homes#about"

  resources :books, only: [:new, :create, :index, :show, :destroy,:edit,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]

end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :followers, on: :menber
    get :followeds, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
