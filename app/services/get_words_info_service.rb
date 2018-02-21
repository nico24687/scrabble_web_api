class GetWordsInfoService

  def find_words(word)
    app_id = ENV['app_id']
    app_key = ENV['app_key']

    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = "4af01898"
      faraday.headers["app_key"] = "4519fdd4a9798d8e03482f48f1e4a389"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/v1/inflections/en/#{word}")

    JSON.parse(response.body)

  end
end 