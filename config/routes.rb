Rails.application.routes.draw do  
  resources :participants
  resources :tasks
  root to: 'tasks#show'
end
