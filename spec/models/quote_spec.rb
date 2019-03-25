require 'rails_helper'

RSpec.describe Quote, type: :model do
  let!(:quote) { Quote.create(text: "Ron Swanson is the best.", length: "5")}

  describe 'average_rating' do
    context 'A review exists' do
      let!(:review) { Quotes::Review.create(rating: 4, quote: quote, ip_address: "2.2.21")}
      let!(:another_review) { Quotes::Review.create(rating: 2, quote: quote, ip_address: "3.2.21")}

      it 'returns the correct average value' do
        expect(quote.average_rating).to eq(3.0)
      end
    end

    context 'A review does not exist' do
      it 'says no ratings yet' do
        expect(quote.average_rating).to eq("No Ratings Yet")
      end
    end
  end
end
