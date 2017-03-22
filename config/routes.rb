Rails.application.routes.draw do

  resources :agendas
  resources :posts

  resources :users do
    resources :posts ,to: 'users#opinion'
  end
  resources :candidates
  resources :political_parties
  resources :consts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
