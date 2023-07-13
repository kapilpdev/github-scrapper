# frozen_string_literal: true

# app/jobs/generate_repositories_job.rb
class GenerateRepositoriesJob < ApplicationJob
  queue_as :default

  def perform(id)
    GithubRepositoryScrapperService.new(id).call
  end
end
