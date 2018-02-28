class WordPresenter
  def initialize(user_input)
    @user_input = user_input
  end
  

  def word 
    response = GetWordsInfoService.new.find_words(@user_input)
    
    if response.has_key?("error")
      Word.new(original: @user_input)
    else
      result = response["results"].first
      Word.new(root: result["lexicalEntries"].first["inflectionOf"].first["text"], original: result["word"])  
    end
  end
  
end 