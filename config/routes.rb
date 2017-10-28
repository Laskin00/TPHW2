Rails.application.routes.draw do
  resources :texts
  get 'text' => 'text#text'
  post 'text' => 'text#create'
  get 'messages/:id' => 'text#read'
end
