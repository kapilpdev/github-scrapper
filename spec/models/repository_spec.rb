require 'rails_helper'

RSpec.describe Repository, type: :model do
  context 'associations' do
    it { should belong_to(:user).counter_cache(true) }
  end

  describe '.search' do
    user = User.create(username: 'kapilpdev')
    repository1 = Repository.create(user_id: '1', title: 'Test Repository', language: 'Ruby', star_count: 10)
    repository2 = Repository.create(user_id: '1', title: 'Another Repository', language: 'JavaScript', star_count: 5)

    context 'when query is present' do
      it 'returns matching repositories' do
        query = 'Test'
        results = Repository.search(user, query)
        expect(results).to include(repository1)
        expect(results).not_to include(repository2)
      end
    end

    context 'when query is blank' do
      it 'returns all user repositories' do
        query = ''
        results = Repository.search(user, query)
        expect(results).to eq(user.repositories)
      end
    end
  end
end
