class GenerateRepositoriesJob < ApplicationJob
  queue_as :default

  def perform(username)
    GithubRepositoryScrapperService.new(username).call
  end
end