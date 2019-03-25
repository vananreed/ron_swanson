require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  let!(:small_quote) { Quote.create(text: "This is a small.", length: "4")}
  let!(:medium_quote) { Quote.create(text: "This is a medium quote.", length: "5")}
  let!(:large_quote) { Quote.create(text: "Ron Swanson is the very best and this is a very large quote.", length: "13")}
  let!(:another_medium_quote) { Quote.create(text: "Ron Swanson says a lot of crazy things.", length: "8")}

  describe 'small quote' do
    it "should only return quotes with length less than 5" do
      expect(subject.small).to contain_exactly(small_quote)
    end
  end

  describe 'medium quote' do
    it "should only return quotes with length greater than 4 and less than 13" do
      expect(subject.medium).to contain_exactly(medium_quote, another_medium_quote)
    end
  end

  describe 'large quote' do
    it "should only return quotes with length greater than 12" do
      expect(subject.large).to contain_exactly(large_quote)
    end
  end
end
