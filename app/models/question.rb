class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :member

  validates :title, :desc, presence: true
end
