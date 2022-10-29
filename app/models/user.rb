class User < ApplicationRecord
  has_many :bars

  validates :name, presence: true
  validates :email, presence: true
end
