Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about',as:'about'
  get '/book/top' =>'books#top'
  resources :books, only: [:index, :show, :new, :create,:edit,:destroy,:update]
  resources :users, only: [:show, :edit,:index,:create,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
