class Card < ActiveRecord::Base
  belongs_to :deck
  has_one :answer

  validates :term, presence: true, uniqueness: true
  validates :definition, presence: true

  def answered?(user)
    Answer.where(card_id: self.id, round_id: session[:round_id]).empty?
  end
end
