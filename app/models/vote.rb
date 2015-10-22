class Vote < ActiveRecord::Base
  belongs_to :vote_type, polymorphic: true
end
