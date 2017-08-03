Rails.application.routes.draw do
  root 'site#top'
  get 'site/top'
  get 'question/index'
  get 'question/show'
  
end
