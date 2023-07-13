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

  context 'has one attached' do
    it { should have_one_attached(:avatar) }
  end

  describe '#validate_github_user' do
    let(:user) { User.new(username: 'testuser') }

    context 'when user is found on GitHub' do
      it 'does not add an error' do
        stub_request(:get, "https://api.github.com/users/testuser/repos")
          .to_return(status: 200, body: '[]')

        expect {
          user.send(:validate_github_user)
        }.not_to change { user.errors.count }
      end
    end

    context 'when user is not found on GitHub' do
      it 'adds an error to the base' do
        stub_request(:get, "https://api.github.com/users/testuser/repos")
          .to_return(status: 404, body: '{"message":"Not Found"}')

          expect {
            user.send(:validate_github_user)
          }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: User not found on github')
      end
    end
  end
end