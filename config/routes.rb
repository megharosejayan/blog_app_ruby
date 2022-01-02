Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to:'pages#about'
  delete 'articles/:id/delete' => 'articles#destroy', as: 'articles_delete'
  get '/articles/:id/delete' => 'articles#destroy'
  resources :articles , only: [:show, :index, :new, :create, :edit, :update]
end
