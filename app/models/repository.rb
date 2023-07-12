# frozen_string_literal: true

# app/models/repository.rb
class Repository < ApplicationRecord
  belongs_to :user, counter_cache: true

  def self.search(user, query)
    if query.present?
      Repository.where(
        "title ILIKE '%#{query.downcase}%'
        OR language ILIKE '%#{query.downcase}%'
        OR star_count ILIKE '%#{query.downcase}%'"
      )
    else
      user.repositories
    end
  end
end
