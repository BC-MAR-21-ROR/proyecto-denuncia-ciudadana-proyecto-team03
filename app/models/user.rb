class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  enum user_type: %i[user administrator]

  # extra validations
  validates :username, presence: true, uniqueness: true 
end
