class Complaint < ApplicationRecord
  acts_as_votable

  has_many_attached :evidences
  has_many :comments

  belongs_to :category
  belongs_to :state
  belongs_to :municipality
  belongs_to :postal
  belongs_to :settlement
  belongs_to :user

  # Validations
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :date_of_events, presence: true
end
