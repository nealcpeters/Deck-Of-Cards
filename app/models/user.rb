class User < ActiveRecord::Base
  has_secure_password
  has_many :answers
  has_many :cards, through: :answers
  has_many :decks, through: :answers, through: :cards
  has_many :rounds, through: :answers


  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, presence: true
end
