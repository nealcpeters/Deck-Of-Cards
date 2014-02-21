class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  validates :title, presence: true
  validates :description, presence: true
  validates_presence_of :user_id
end
