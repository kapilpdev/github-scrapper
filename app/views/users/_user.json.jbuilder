# frozen_string_literal: true

json.extract! user, :id, :username, :repositories_count, :created_at, :updated_at
json.url user_url(user, format: :json)
