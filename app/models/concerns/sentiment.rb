class Sentiment

  def initialize
    
  end
  
  def response(tweet)
    response = HTTParty.post("http://sentiment.vivekn.com/api/text/",
                { 
                  :body => { 'txt' => "#{tweet}" }
                })
  end

end