module WelcomeHelper

  def sentiment_class(sentiment)
    if sentiment == "Positive"
      'list-group-item-success'
    elsif sentiment == "Negative"
      'list-group-item-danger'
    else
      'list-group-item-warning'
    end
  end

  def sentiment_hash(tweets)
    positive, negative, neutral = 0, 0, 0
    tweets['data'].each do |tweet|
      if tweet[0][:sentiment] == "Positive"
        positive += 1
      elsif tweet[0][:sentiment] == "Negative"
        negative += 1
      else
        neutral += 1
      end
    end
    array = { "Neutral" => neutral, "Postive" => positive, "Negative" => negative}
    return array
  end
  
end