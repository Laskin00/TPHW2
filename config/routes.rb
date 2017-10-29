Rails.application.routes.draw do
  resources :texts
  root 'text#index'
  post 'text#index' =>'text#create'
  get 'messages/:id' => 'text#read'
end
