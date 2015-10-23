class Member < ActiveRecord::Base
  before_create :gives_member_token
  has_secure_password

  has_many :questions
  has_many :answers
  has_many :votes

  validates :email, uniqueness: true
  validates :name, :email, :password, presence: true

  def gives_member_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end
