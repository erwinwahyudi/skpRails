Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'skp', to: 'home#index'
  get 'skp/duplikat/:id', to: 'home#duplikat'
end
