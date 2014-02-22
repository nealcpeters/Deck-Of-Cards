class Answer < ActiveRecord::Base
  belongs_to :round
  belongs_to :user, through: :rounds
  belongs_to :card
end
