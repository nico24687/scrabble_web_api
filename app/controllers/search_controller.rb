class SearchController < ApplicationController 
  def index 
    word = params[:q]
    @words = WordPresenter.new(word).words
  end
end