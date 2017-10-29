Rails.application.routes.draw do
  resources :texts
  root 'text#index'
  post 'text' =>'text#create'
  get 'messages/:id' => 'text#read'
end
