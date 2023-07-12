class User < ApplicationRecord
  validates :username, presence: true
  has_many :repositories
  has_one_attached :avatar
end
