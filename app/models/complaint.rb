class Complaint < ApplicationRecord
  acts_as_votable
  
  has_many_attached :evidences

  belongs_to :category
  belongs_to :state
  belongs_to :municipality
  belongs_to :postal
  belongs_to :settlement
  belongs_to :user
end
