class Deck < ActiveRecord::Base
  has_many :cards
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates_presence_of :user_id
end
