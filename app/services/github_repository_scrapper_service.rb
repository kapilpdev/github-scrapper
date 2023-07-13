# frozen_string_literal: true

# app/services/github_repository_scrapper_service.rb
class GithubRepositoryScrapperService
  BASE_URL = 'https://api.github.com'

  def initialize(id)
    @user = User.find(id)
  end

  def call
    user_avatar_url = nil
    repo_hash = collect_repo_info.map do |repo|
      user_avatar_url = repo['owner']['avatar_url'] || repo['owner']['gravatar_url']
      {
        title: repo['name'], star_count: repo['stargazers_count'],
        language: repo['language'], url: repo['html_url']
      }
    end

    create_repository(repo_hash) if @user.repositories_count.to_i < repo_hash.size
    update_user_avatar(user_avatar_url) if user_avatar_url
  end

  def collect_repo_info
    url = BASE_URL + "/users/#{@user.username}/repos?per_page=500"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end

  def create_repository(repos_data)
    repos_data.each do |data|
      repo = @user.repositories.find_or_create_by(title: data[:title])
      repo.update(star_count: data[:star_count], language: data[:language], url: data[:url])
      repo.save!
    end
  end

  def update_user_avatar(url)
    @user.update(avatar: url)
  end
end
