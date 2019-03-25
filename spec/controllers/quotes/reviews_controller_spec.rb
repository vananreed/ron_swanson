require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let!(:quote) { Quote.create(text: "Ron Swanson is the best.", length: "5")}
  let!(:review) { Quotes::Review.create(rating: 4, quote: quote, ip_address: "2.2.21")}

  describe 'can create a review' do
    it 'should have a review saved' do
      expect(Quotes::Review.all.count).to eq(1)
    end
  end

  describe 'a user cannot rate the same quote twice' do
    let!(:another_review) { Quotes::Review.create(rating: 3, quote: quote, ip_address: "2.2.21")}

    it 'should only save one review' do
      expect(Quotes::Review.all.count).to eq(1)
    end
  end
end
