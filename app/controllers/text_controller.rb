class TextController < ApplicationController
  require 'json'
  require 'net/http'

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

    if request.headers["Content-Type"] == 'application/json'
      $message = params[:message]
      Text.create(:text => $message, :number => $id)
      $id = $id + 1
      url = "https://texthider.herokuapp.com/messages/" + $id.to_s
      render plain: "'"'{"url":' + '"' + url.to_s + '"}'"'" + "\n"
    end

    if request.headers["Content-Type"] == 'text/xml'
      $message = Nokogiri::XML(request.body.read).content
      Text.create(:text => $message, :number => $id)
      $id = $id + 1
      url = "https://texthider.herokuapp.com/messages/" + $id.to_s
      render plain: '<url>' + url.to_s + '</url>' + "\n"
    end

  end
end
