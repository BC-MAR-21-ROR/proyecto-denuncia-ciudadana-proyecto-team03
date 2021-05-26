class Postal < ApplicationRecord
  belongs_to :municipality

  # relations
  has_many :interest_places
  has_many :settlements
end
