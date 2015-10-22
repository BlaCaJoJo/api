class Vote < ActiveRecord::Base
  belongs_to :member
  belongs_to :vote_for, polymorphic: true

end
