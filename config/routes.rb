Rails.application.routes.draw do
  root 'site#top'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#login'
  delete 'logout'  => 'sessions#destroy'
  get 'user/new'
  post 'user/create'
  get 'user/edit' #/:id
  #putch 'user/:id'
  #delete 'user/destroy/:id'
  get 'top' => 'site#top'
  get 'questions/index_col' => 'question#index_col'
  get 'questions/index_hs' => 'question#index_hs'
  get 'question/show'
  get 'question/new'

end
