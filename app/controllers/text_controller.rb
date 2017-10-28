class TextController < ApplicationController
  $message = ""
  $id = 0
  def create
    $message = params[:text]
    heroku_link = "https://texthider.herokuapp.com/messages/"
    Text.create(:text => $message, :number => $id)
    $id = $id + 1
    render plain: heroku_link + $id.to_s
  end
  def read
      render plain: Text.find_by(:number => ($id - 1)).text
  end
end
