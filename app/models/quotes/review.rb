class Quotes::Review < ApplicationRecord
  belongs_to :quote
  validates :ip_address, uniqueness: { scope: :quote }
end
