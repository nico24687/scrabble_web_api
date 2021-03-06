class GetWordsInfoService

  def find_words(word)


    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = ENV['app_id']
      faraday.headers["app_key"] = ENV['app_key']
      faraday.adapter Faraday.default_adapter
    end


    response = @conn.get("/api/v1/inflections/en/#{word}")
    if response.status == 200 
      JSON.parse(response.body)
    else 
      {"error" => "word not found"}
    end 

    

  

  end
end 