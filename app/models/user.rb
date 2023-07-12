# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  validates :username, presence: true

  has_many :repositories, dependent: :destroy
  has_one_attached :avatar

  before_create :validate_github_user
  after_create :fetch_public_repositories

  private

  def validate_github_user
    url = "https://api.github.com/users/#{username}/repos"
    response = HTTParty.get(url)
    errors.add(:base, 'User not found on github') if response.include?('message')
    throw(:abort) if errors.any?

    true
  end

  def fetch_public_repositories
    GenerateRepositoriesJob.perform_now(username)
  end
end
