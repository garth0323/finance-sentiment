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
  
end