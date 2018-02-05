Rails.application.routes.draw do
  resources :formulations
  resources :ingredients

  post '/report/create', to: 'report#create'
end
