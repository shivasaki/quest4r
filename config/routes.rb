Rails.application.routes.draw do

  root 'site#home'

  get 'about', to: 'site#about'

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :questions, :answers

  get 'questions_col' => 'questions#index_col'
  get 'questions_hs' => 'questions#index_hs'
end
