class Member < ActiveRecord::Base
  has_secure_password
  
  has_many :questions
  has_many :answers
  has_many :votes

  validates :email, uniqueness: true
  validates :name, :email, :password, presence: true
end
