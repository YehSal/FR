class UpdateNews
  attr_accessor :char_params, :user_params

  def initialize(char_params)
    @char_params = char_params
  end

  def posupdate
    # for positive
    result = HTTP.get("https://gateway-a.watsonplatform.net/calls/data/GetNews?apikey=1c91f2bbcd4d15e3436593b9b4d95b80d199dd7d&outputMode=json&start=now-24h&end=now&q.enriched.url.title=A["+ @char_params.f_name + "^" + @char_params.l_name + "]&q.enriched.url.docSentiment.type=positive")
    jsonResult = JSON.parse(result.to_s)
    @poscount = jsonResult['result']['count']
  end

  def negupdate
    result = HTTP.get("https://gateway-a.watsonplatform.net/calls/data/GetNews?apikey=1c91f2bbcd4d15e3436593b9b4d95b80d199dd7d&outputMode=json&start=now-24h&end=now&q.enriched.url.title=A["+ @char_params.f_name + "^" + @char_params.l_name + "]&q.enriched.url.docSentiment.type=negative")
    jsonResult = JSON.parse(result.to_s)
    @negcount = jsonResult['result']['count']
  end
end
