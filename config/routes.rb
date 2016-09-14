Rails.application.routes.draw do
  resources :tactics
  resources :unit_types
  get 'simulation/index'

  get 'simulation/dice_roll'
  post 'simulation/dice_roll'
  get 'simulation/grid'
  get 'simulation/make_army'
  get 'simulation/one_simulation'
  post 'simulation/one_simulation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :unit_attribute_types
  resources :armies
  resources :unit_attributes
  resources :unit_types
  root 'armies#index'
end
