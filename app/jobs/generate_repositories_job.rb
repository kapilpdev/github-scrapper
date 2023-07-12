# frozen_string_literal: true

# app/jobs/generate_repositories_job.rb
class GenerateRepositoriesJob < ApplicationJob
  queue_as :default

  def perform(username)
    GithubRepositoryScrapperService.new(username).call
  end
end
