class WelcomeController < ApplicationController

  def index

  end

  def search
    Pusher['test_channel'].trigger('search', {
      :search => "#{params[:query]}"
    })
    ticker      = params[:query]
    @data       = yahoo_data(ticker)
    @chart_data = yahoo_chart(ticker)
    @twitter    = TwitterApi.new.response(ticker)
  end

  private

  def search_params
    params.require(:search).(:query)
  end

  def yahoo_data ticker
    yahoo_client = YahooFinance::Client.new
    yahoo_client.quotes([ticker], [:ask,
                                   :bid, 
                                   :low_52_weeks, 
                                   :high_52_weeks, 
                                   :change, 
                                   :previous_close, 
                                   :volume, 
                                   :average_daily_volume,
                                   :name,
                                   :symbol],
                                     { raw: false } )
  end

  def yahoo_chart ticker
    yahoo_client = YahooFinance::Client.new
    quotes = yahoo_client.historical_quotes(ticker, { raw: false, period: :daily, start_date: Time::now-(24*60*60*30), end_date: Time::now })
    date_and_close_json quotes
  end

  def date_and_close_json quotes
    closes = {}
    quotes.each do |day|
      closes[day["trade_date"]] = day["close"].to_f.round(4)
    end
    return closes
  end
end
