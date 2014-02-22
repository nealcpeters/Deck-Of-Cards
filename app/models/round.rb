class Round < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :answers



  def number_incorrect
    self.answers.where(result: false).count
  end

  def number_correct
    self.answers.where(result: true).count
  end

  def total_number
    self.deck.cards.count
  end

  def percentage_correct
    ((number_correct / total_number.to_f) * 100).floor
  end
end
