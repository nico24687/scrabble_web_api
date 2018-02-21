class SearchController < ApplicationController 
  def index 
    @words = [Word.new, Word.new]
  end
end