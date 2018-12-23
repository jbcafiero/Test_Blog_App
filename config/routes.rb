Rails.application.routes.draw do
  get 'profiles' => 'profiles#index'
  get 'profile/:username' => 'profiles#show', as: 'profile'
  get 'profile/:username/edit' => 'profiles#edit', as: 'profileedit'
  patch 'profile/:username' => 'profiles#update', as: 'userupdate'

  get 'signup' => 'users#new'
  post 'create' => 'users#create', as: 'signed'
  get 'signin' => 'sessions#new', as: 'login'
  post 'start' => 'sessions#create', as: 'createsession'
  delete 'end' => 'sessions#delete'

  get 'home' => 'articles#home'

  get 'articles' => 'articles#index'
  post 'posts' => 'articles#create', as: 'posts'
  get 'articles/new' => 'articles#new'
  get 'articles/:id/edit' => 'articles#edit', as: 'edit'
  get 'articles/:id' => 'articles#show', as: 'show'
  patch 'articles/:id' => 'articles#update', as: 'update'
  delete 'articles/:id' => 'articles#delete', as: 'article'
end
