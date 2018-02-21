class SearchController < ApplicationController 
  def index 
    @words = WordPresenter.new
  end
end