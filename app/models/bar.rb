class Bar < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
