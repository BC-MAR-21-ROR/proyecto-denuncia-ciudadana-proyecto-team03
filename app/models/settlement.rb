class Settlement < ApplicationRecord
  belongs_to :zip

  # relations
  has_many :interest_places
end
