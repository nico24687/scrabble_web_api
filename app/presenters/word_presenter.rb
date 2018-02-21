class WordPresenter
  def initialize(word)
    @word = word
  end
  
  def words 
    [Word.new(root: "random root")]
  end
end 