require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      favorite = build(:favorite)
      expect(favorite).to be_valid
    end

    it 'is invalid without user_id' do
      favorite = build(:favorite, user_id: nil)
      expect(favorite).not_to be_valid
    end

    it 'is invalid without post_id' do
      favorite = build(:favorite, post_id: nil)
      expect(favorite).not_to be_valid
    end

    

  end
end
