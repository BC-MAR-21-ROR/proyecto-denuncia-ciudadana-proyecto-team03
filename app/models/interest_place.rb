class InterestPlace < ApplicationRecord
  belongs_to :user
  belongs_to :postal
  belongs_to :settlement

  validates :settlement_id, uniqueness: {scope: :user_id} 
end
