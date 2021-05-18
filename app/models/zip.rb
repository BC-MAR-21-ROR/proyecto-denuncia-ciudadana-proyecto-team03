class Zip < ApplicationRecord
  belongs_to :municipality

  # relations
  has_many :interest_places
end
