# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  validates :username, presence: true

  has_many :repositories, dependent: :destroy

  before_create :validate_github_user
  after_create :fetch_public_repositories

  private

  def validate_github_user
    return true if User.find_by(username:)

    url = "https://api.github.com/users/#{username}/repos?per_page=500"
    response = HTTParty.get(url)
    errors.add(:base, 'User not found on github') if response.include?('message')
    raise ActiveRecord::RecordInvalid, self if errors[:base].any?

    true
  end

  def fetch_public_repositories
    GenerateRepositoriesJob.perform_now(id)
  end
end
