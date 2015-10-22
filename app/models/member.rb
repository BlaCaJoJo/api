class Member < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes
  has_secure_password

  validates :email, uniqueness: true
  validates :name, :email, :password, presence: true
end
