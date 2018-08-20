Rails.application.routes.draw do
  get 'home/grain_home'
  #post 'home/grain_home'
  get 'home/grain_index'

  root 'home#index'
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
