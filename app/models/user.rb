class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum user_type: %i[user administrator]

  include PermissionsConcern

  # extra validations
  validates :username, presence: true, uniqueness: true 

  # relations
  has_many :interest_places
end
