Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to:'pages#about'
  delete 'articles/:id/delete' => 'articles#destroy', as: 'articles_delete'
  get '/articles/:id/delete' => 'articles#destroy'
  resources :articles , only: [:show, :index, :new, :create, :edit, :update]
  get 'signup', to: 'users#new'
  resources :users, excpet: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  #delete 'logout', to: 'sessions#destroy'
  delete 'logout' => 'sessions#destroy', as: 'sessions_delete'
  get 'logout' => 'sessions#destroy'
end
