class QuotesController < ApplicationController

  def create
    size = params[:size]
    last_quote = params[:last_quote] ? Quote.find(params[:last_quote]) : Quote.first
    @quote = quote(size, last_quote)
    redirect_to quotes_path(quote: @quote)
  end

  def index
    @quote = params[:quote] ? Quote.find(params[:quote].to_i) : nil
    @review = Quotes::Review.new
  end

  def small(last_quote)
    Quote.where.not(text: last_quote.text).where("length < 5")
  end

  def medium(last_quote)
    Quote.where.not(text: last_quote.text).where("length > 4 and length < 13")
  end

  def large(last_quote)
    Quote.where.not(text: last_quote.text).where("length > 12")
  end

  def any(last_quote)
    new_quote = Quote.all
  end

  def quote(size, last_quote)
    public_send(size, last_quote).sample
  end
end
