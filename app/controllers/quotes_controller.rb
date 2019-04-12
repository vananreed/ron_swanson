class QuotesController < ApplicationController

  def create
    size = params[:size]
    @last_quote = params[:last_quote] ? Quote.find(params[:last_quote]) : Quote.first
    @quote = quote(size)
    redirect_to quotes_path(quote: @quote)
  end

  def index
    @quote = params[:quote] ? Quote.find(params[:quote].to_i) : nil
    @review = Quotes::Review.new
  end

  def small
    any.where("length < 5")
  end

  def medium
    any.where("length > 4 and length < 13")
  end

  def large
    any.where("length > 12")
  end

  def any
    @last_quote.not_self
  end

  private

  def quote(size)
    public_send(size).sample
  end
end
