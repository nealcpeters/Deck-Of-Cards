class Card < ActiveRecord::Base
  belongs_to :deck
  has_one :answer

  validates :term, presence: true, uniqueness: true
  validates :definition, presence: true

  def answered?(user, round_id)
    Answer.where(card_id: self.id, round_id: round_id).empty?
  end
end
