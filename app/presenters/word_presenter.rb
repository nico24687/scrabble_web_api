class WordPresenter
  def initialize(word)
    @word = word
  end
  
  def words 
    GetWordsInfoService.new.find_words(word)["results"].first["lexicalEntries"].first["inflectionOf"].first.map do |word|
      Word.new(root: word["text"])
    end 
  end
end 