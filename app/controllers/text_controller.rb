class TextController < ApplicationController
  require 'json'
  $message = ""
  $id = 0
  def index
  end
  def create
    $message = params[:text]
    $heroku_link = "https://texthider.herokuapp.com/messages/"
    Text.create(:text => $message, :number => $id)
    $id = $id + 1
    render plain: $heroku_link.to_s + $id.to_s
  end
  def read
      render plain: Text.find_by(:number => ($id - 1)).text
      Text.find_by(:number => ($id - 1)).delete
  end
  def c_json
    $message = params[:message]
    Text.create(:text => $message, :number => $id)
    $id = $id + 1
    render plain: $heroku_link.to_s + $id.to_s
  end
end
