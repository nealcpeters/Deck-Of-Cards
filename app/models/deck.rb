class Deck < ActiveRecord::Base
  belongs_to :user, through: :cards, through: :answers
  has_many :cards

  validates :title, presence: true
  validates :description, presence: true
end
