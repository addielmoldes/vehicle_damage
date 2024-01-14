Rails.application.routes.draw do

  root 'home#index'
  get 'edit_damage', to: 'home#edit_damage'
  post 'save_damage', to: 'home#save_damage'
end
