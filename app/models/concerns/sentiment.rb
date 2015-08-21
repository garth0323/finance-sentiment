class Sentiment

  def initialize
    
  end
  
  def response(tag)
    response = HTTParty.post("http://sentiment.vivekn.com/api/text/",
                { 
                  :payload => { 'txt' => "Fuck NO" }
                 })
    
  end


end