# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'
require 'httparty'

RSpec.describe User, type: :model do
  include ActiveJob::TestHelper
  context 'associations' do
    it { should have_many(:repositories).class_name('Repository') }
  end

  context 'validations' do
    it { should validate_presence_of(:username) }
  end

  describe '#validate_github_user' do
    let(:user) { User.new(username: 'testuser') }

    context 'when user is found on GitHub' do
      it 'does not add an error' do
        stub_request(:get, 'https://api.github.com/users/testuser/repos')
          .to_return(status: 200, body: '[]')

        expect do
          user.send(:validate_github_user)
        end.not_to(change { user.errors.count })
      end
    end

    context 'when user is not found on GitHub' do
      it 'adds an error to the base' do
        stub_request(:get, 'https://api.github.com/users/testuser/repos')
          .to_return(status: 404, body: '{"message":"Not Found"}')

        expect do
          user.send(:validate_github_user)
        end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: User not found on github')
      end
    end
  end
end
