class User < ApplicationRecord
  validates :username, presence: true
  # before_create :validate_github_user
  has_many :repositories, dependent: :destroy

  has_one_attached :avatar

  after_create :fetch_public_repositories

  private

  # def validate_github_user
  #   url = "https://api.github.com/users/#{username}/repos"
  #   response = HTTParty.get(url)
  #   if response['message'] == 'Not Found'
  #     return errors.add(:base, "User not found on github")
  #   end
  # end

  def fetch_public_repositories
    GithubRepositoryScrapperService.new(username).call
  end 
end
