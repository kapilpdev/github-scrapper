# frozen_string_literal: true

# app/services/github_repository_scrapper_service.rb
class GithubRepositoryScrapperService
  attr_accessor :username

  BASE_URL = 'https://api.github.com'

  def initialize(username)
    @username = username
    @user = User.find_by(username:)
  end

  def call
    repo_hash = collect_repo_info.map do |repo|
      { title: repo['name'], star_count: repo['stargazers_count'], language: repo['language'],
        url: repo['owner']['html_url'], avatar: repo['owner']['avatar_url'] }
    end

    create_repository(repo_hash)
  end

  def collect_repo_info
    url = BASE_URL + "/users/#{username}/repos"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end

  def create_repository(repos_data)
    repos_data.each do |data|
      repo = @user.repositories.find_or_create_by(title: data[:title])
      repo.update(star_count: data[:star_count], language: data[:language], url: data[:url])
      repo.save!
    end

    require 'open-uri'
    url = URI.open(repos_data.first[:avatar])
    @user.avatar.attach(io: url, filename: 'image.jpg')
  end
end
