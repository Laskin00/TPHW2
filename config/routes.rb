Rails.application.routes.draw do
  resources :texts
  root 'text#text'
  post '' => 'text#create'
  get 'messages/:id' => 'text#read'
  get'notes/api' => 'text#c_json'
end
