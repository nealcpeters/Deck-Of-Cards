class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :answers

  validates :term, presence: true, uniqueness: true
  validates :definition, presence: true
end
