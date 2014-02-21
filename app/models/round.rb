class Round < ActiveRecord::Base
  belongs_to :user, through: :answers
  belongs_to :answer
end
