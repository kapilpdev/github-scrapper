# frozen_string_literal: true

# app/services/github_repository_scrapper_service.rb
class GithubRepositoryScrapperService
  attr_accessor :username

  BASE_URL = 'https://api.github.com'

  def initialize(username)
    @username = username
    @user = User.find_by(username: username)
  end

  def call
    collect_repo_info.each do |repo|
      @user.repositories.create({
        title: repo['name'],
        star_count: repo['stargazers_count'],
        language: repo['language'],
        url: repo['url']
      })
    end
  end


  def collect_repo_info
    url = BASE_URL + "/users/#{username}/repos"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end
end
