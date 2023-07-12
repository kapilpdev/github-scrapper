class RepositoriesController < ApplicationController

  def search
    repo_hash = ScrapperService.new(params[:username]).call
    create_repo(repo_hash)
  end

  def create_repo(result)
    if !result.include?(:message)
      result.each do |data|
        repo = user.repositories.find_or_create_by(title: data[:name])
        repo.star_count = data[:stars]
        repo.save!
      end
    else
      return result[:message]
    end
  end

  def user
    User.find_or_create_by(username: params[:username])
  end
end
