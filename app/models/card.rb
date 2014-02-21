class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :answers
  belongs_to :users, through: :answers

  validates :term, presence: true, uniqueness: true
  validates :definition, presence: true, uniqueness: true
end
