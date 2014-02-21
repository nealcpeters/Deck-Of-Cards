class Card < ActiveRecord::Base
  validates :term, presence: true, uniqueness: true
  validates :definition, presence: true, uniqueness: true
end
