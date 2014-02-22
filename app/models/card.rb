class Card < ActiveRecord::Base
  belongs_to :deck
  has_one :answer

  validates :term, presence: true, uniqueness: true
  validates :definition, presence: true

  def answered?(round_id)
    Answer.where(card_id: self.id, round_id: round_id).empty?
  end

  def answer(round_id)
  	a = Answer.where(card_id: self.id, round_id: round_id).first
  	if a
  		a.result
  	else
  		"not-answered"
  	end
  end
end
