class Answer < ActiveRecord::Base
  has_many :votes, as: :vote_for
  belongs_to :question

  validates :desc, presence: true
end
