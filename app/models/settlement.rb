class Settlement < ApplicationRecord
  belongs_to :postal

  # relations
  has_many :interest_places
end
