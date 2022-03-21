class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
  end

  def score
    require "json"
    require "open-uri"

    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    if user["found"]
      @score = user["length"]
    else
      @score = user["error"]
    end
  end
end
