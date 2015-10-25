class Answer < ActiveRecord::Base
  has_many :votes, as: :vote_for
  belongs_to :member
  has_one :question

  validates :desc, presence: true

  def reformatted_date
    self.created_at.strftime("Posted on %m/%d/%y at %I:%M%p")
  end

  def vote_rating
    @up_votes = self.votes.where(up_down: true).count
    @down_votes = self.votes.where(up_down: false).count
    @vote_rating = @up_votes - @down_votes
  end
end
