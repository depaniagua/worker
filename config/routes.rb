Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/convert'

  resources :concursos do
    resources :voces
  end

  # Se cambia el home para que sea el de concursos una vez se inicia la sesion
  #root 'home#index'
  root 'home#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
