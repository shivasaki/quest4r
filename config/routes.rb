Rails.application.routes.draw do
  root 'site#top'
  get 'site/top'
  get 'question/index_col'
  get 'question/index_hs'
  get 'question/show'
  
end
