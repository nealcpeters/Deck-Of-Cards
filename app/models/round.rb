class Round < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :answers
end
