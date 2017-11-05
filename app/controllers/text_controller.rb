class TextController < ApplicationController
  require 'json'
  $message = ""
  $id = 0
  def index
  end
  def create
    $message = params[:text]
    Text.create(:text => $message, :number => $id)
    $id = $id + 1
    render plain: "https://texthider.herokuapp.com/messages/" + $id.to_s
  end
  def read
      render plain: Text.find_by(:number => ($id - 1)).text
      Text.destroy_all
  end
  def c_json
    $message = params[:message]
    Text.create(:text => $message, :number => $id)
    $id = $id + 1
    render plain: "https://texthider.herokuapp.com/messages/" + $id.to_s + "\n"
  end
end
