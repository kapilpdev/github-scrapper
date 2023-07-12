class RepositoriesController < ApplicationController

  def show
    repo_hash = ScrapperService.new(params[:username]).call
    create_repo(repo_hash)
  end
  
  def search
  end

  def create_repo(result)
    if !result.include?(:message)
      result.each do |data|
        repo = user.repositories.find_or_create_by(title: data[:title])
        debugger
        repo.star_count = data[:stars]
        repo.language = data[:language]
        repo.url = data[:url]
        repo.save!
        @repo = repo
      end
    else
      return result[:message]
    end
  end

  def user
    User.find_or_create_by(username: params[:username])
  end
end
