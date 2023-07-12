# frozen_string_literal: true

# app/services/create_data_service.rb
class ScrapperService
  attr_accessor :username

  BASE_URL = 'https://api.github.com'

  def initialize(username)
    @username = username
  end

  def call
    collect_repo_info.map do |repo|
      if repo.length > 2
      { title: repo['name'], stars_count: repo['stargazers_count'], language: repo['language'], url: repo['url']  }
      else
        return {message: 'not found'}
      end
    end
  end

  def collect_repo_info
    url = BASE_URL + "/users/#{username}/repos"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end
end
