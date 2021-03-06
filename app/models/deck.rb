class Deck < ActiveRecord::Base
  has_many :cards
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates_presence_of :user_id

  def total_cards
    self.cards.count
  end

  def answered_correct(user)
    round = user.rounds.where(deck_id: self.id).last
    if round
      return Answer.where(result: true, round_id: round.id).count
    else
    	return 0
    end
  end

  def answered_incorrect(user)
    round = user.rounds.where(deck_id: self.id).last
    if round
      return Answer.where(result: false, round_id: round.id).count
    else
    	return 0
    end
  end

  def answered(user)
    round = user.rounds.where(deck_id: self.id).last
    if round
    	return Answer.where(round_id: round.id).count
    else
    	return 0
    end
  end

  def percent_correct(user)
    round = user.rounds.where(deck_id: self.id).last
    if round
      ((answered_correct(user) / total_cards.to_f) * 100).floor
    else
      return 0.to_f.round
    end
  end

  def percent_incorrect(user)
    round = user.rounds.where(deck_id: self.id).last
    if round
      ((answered_incorrect(user) / total_cards.to_f) * 100).floor
    else
      return 0.to_f.round
    end
  end

  def percent_complete(user)
    round = user.rounds.where(deck_id: self.id).last
    if round
      ((answered(user) / total_cards.to_f) * 100).floor
    else
      return 0.to_f.round
    end
  end
end

