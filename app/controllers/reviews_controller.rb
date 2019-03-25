class ReviewsController < ApplicationController

  def create
    @quote = Quote.find(params[:quote_id])
    Quotes::Review.create!(review_params.merge(quote: @quote, ip_address: request.remote_ip))

    redirect_to quotes_path(quote: @quote)
  end

  private

  def review_params
    params.require(:quotes_review).permit(:rating)
  end
end
