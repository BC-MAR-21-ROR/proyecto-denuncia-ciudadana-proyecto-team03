class InterestPlace < ApplicationRecord
  belongs_to :user
  belongs_to :zip
  belongs_to :settlement

  validates :settlement_id, uniqueness: {scope: :user_id} 
end
