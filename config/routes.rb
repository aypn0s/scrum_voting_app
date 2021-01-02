Rails.application.routes.draw do  
  resources :participants do
    get :vote_form
    patch :update_vote
  end
  resources :tasks
  root to: 'tasks#show'
end
