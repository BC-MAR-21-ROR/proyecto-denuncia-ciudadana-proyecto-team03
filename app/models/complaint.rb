class Complaint < ApplicationRecord
  belongs_to :category
  belongs_to :state
  belongs_to :municipality
  belongs_to :zip
  belongs_to :settlement
end
