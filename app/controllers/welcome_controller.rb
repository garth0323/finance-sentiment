class WelcomeController < ApplicationController

  def index

  end

  def search
    ticker = params[:query]
    @data = yahoo_data(ticker)
    @twitter = TwitterApi.new.response(ticker)
  end

  private

  def search_params
    params.require(:search).(:query)
  end

  def yahoo_data(ticker)
    yahoo_client = YahooFinance::Client.new
    yahoo_client.quotes([ticker], [:ask,
                                   :bid, 
                                   :low_52_weeks, 
                                   :high_52_weeks, 
                                   :change, 
                                   :previous_close, 
                                   :volume, 
                                   :average_daily_volume],
                                     { raw: false } )
  end

end
