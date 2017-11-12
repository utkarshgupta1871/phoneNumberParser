Rails.application.routes.draw do
  root 'phones#index' 
  get 'phones/index'
  post 'phones' => 'phones#create'
  post 'phones/index' => 'phones#create'
  get 'country'=>'phones#api'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
