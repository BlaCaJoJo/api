class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :vote_for
  belongs_to :member

  validates :title, :desc, presence: true

  attr_reader :question

  def reformatted_date
    self.created_at.strftime("Posted on %m/%d/%y at %I:%M%p")
  end
end
