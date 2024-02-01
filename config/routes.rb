Rails.application.routes.draw do

  root 'home#index'
  get 'show_damage/:id', to: 'home#show_damage', as: 'show_damge'
  get 'edit_damage/:id', to: 'home#edit_damage', as: 'edit_damage'
  post 'save_damage/:id', to: 'home#save_damage', as: 'save_damage'
  # patch 'save_damage/:id', to: 'home#save_damage', as: 'save_damage'
end
