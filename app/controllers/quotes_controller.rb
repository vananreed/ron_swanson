class QuotesController < ApplicationController

  def create
    size = params[:size]
    @quote = quote(size)
    redirect_to quotes_path(quote: @quote)
  end

  def index
    @quote = params[:quote] ? Quote.find(params[:quote].to_i) : nil
    @review = Quotes::Review.new
  end

  def small
    Quote.where("length < 5")
  end

  def medium
    Quote.where("length > 4 and length < 13")
  end

  def large
    Quote.where("length > 12")
  end

  def any
    Quote.all
  end

  def quote(size)
    public_send(size).sample
  end
end
