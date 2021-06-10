class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  acts_as_voter
  enum user_type: %i[user administrator]

  include PermissionsConcern

  # extra validations
  validates :username, presence: true, uniqueness: true

  # relations
  has_one_attached :avatar

  has_many :interest_places
  has_many :complaints
  has_many :comments
end
