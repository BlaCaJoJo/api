class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :vote_for
  belongs_to :member

  validates :title, :desc, presence: true

  attr_reader :question

  def reformatted_date
    self.created_at.strftime("Posted on %m/%d/%y at %I:%M%p")
  end

  def vote_rating
    @up_votes = self.votes.where(up_down: true).count
    @down_votes = self.votes.where(up_down: false).count
    @vote_rating = @up_votes - @down_votes
  end

  def answer_breakdown
    list = []
    self.answers.each do |a|
      list << {
        member_id: a.member.id,
        member_name: a.member.name,
        member_email: a.member.email,
        answer_id: a.id,
        desc: a.desc,
        accepted: a.accepted,
        date: a.reformatted_date,
        vote_rating: a.vote_rating
      }
    end
    list
  end

  def reformat_list
    list = {
        member_id: self.member.id,
        member_name: self.member.name,
        member_email: self.member.email,
        question_id: self.id,
        title: self.title,
        description: self.desc,
        date: self.reformatted_date,
        vote_rating: self.vote_rating,
        answers: self.answer_breakdown
      }
    list
  end
end
