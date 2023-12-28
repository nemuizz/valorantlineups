require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    
    it 'is valid with valid attributes' do
      post = create(:post)
      expect(post).to be_valid
    end

    it 'is not valid without title' do
      post = build(:post, title: nil)
      expect(post).not_to be_valid
    end

    it 'is not valid without user_id' do
      post = build(:post, user_id: nil)
      expect(post).not_to be_valid
    end

    it 'is not valid without agent_id' do
      post = build(:post, agent_id: nil)
      expect(post).not_to be_valid
    end

    it 'is not valid without map_id' do
      post = build(:post, map_id: nil)
      expect(post).not_to be_valid
    end

    it 'is not valid with title that have more than 50 characters' do
      post = build(:post, title: Faker::Lorem.characters(number: 51))
      expect(post).not_to be_valid
    end

    it 'is not valid with content that have more than 500 characters' do
      post = build(:post, content: Faker::Lorem.characters(number: 501))
    end

  end
end
