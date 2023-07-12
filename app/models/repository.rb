class Repository < ApplicationRecord
  belongs_to :user, counter_cache: true

  def self.search(user, q)
    if q.present?
      Repository.where(
        "title ILIKE '%#{q.downcase}%'
        OR language ILIKE '%#{q.downcase}%'
        OR star_count ILIKE '%#{q.downcase}%'"
      )
    else
      user.repositories
    end
  end
end
