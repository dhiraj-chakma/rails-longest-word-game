require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{:word}"
    validWord = URI.open(url).read
    ans = JSON.parse(validWord)
    @wordList = params[:token]
    @word = params[:word]
    @result = ""

    @word.each_char do |ch|
      if @wordList.include?(ch) == false
        @result = "the word you write include character outside list"
      end
    end

    if ans["found"]
      @result = "congratulation! #{:word} is a valid word"
    else
      @result = "sorry! #{:word} is not a valid word"
    end
  end
end
