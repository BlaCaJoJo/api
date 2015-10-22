class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :vote_for
  belongs_to :member

  validates :title, :desc, presence: true
end
