class Sentiment

  def initialize
    
  end
  
  def self.response(tweet)
    HTTParty.post("http://sentiment.vivekn.com/api/text/",{ :body => { 'txt' => "#{tweet}" }})
  end
end