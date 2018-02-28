class WordPresenter
  def initialize(user_input)
    @user_input = user_input
  end
  

  def word 
    result = GetWordsInfoService.new.find_words(@user_input)["results"].first
    Word.new(root: result["lexicalEntries"].first["inflectionOf"].first["text"], original: result["word"])  
  end
  
end 