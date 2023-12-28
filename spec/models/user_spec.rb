require 'rails_helper'

RSpec.describe User, type: :model do
  # バリデーションのテスト
  context 'validations' do
    it 'is valid with valid attributes' do
      user = build(:user) # FactoryGirlや FactoryBotを使用してUserオブジェクトを作成
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without p password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without a name' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end
  end

  # Deviseが提供するメソッドのテスト
  context 'Devise methods' do
    it 'returns the encrypted password' do
      user = build(:user, password: 'password')
      encrypted_password = user.encrypted_password
      expect(encrypted_password).not_to be_empty
    end

    #it 'generates a password reset token' do
      #user = create(:user) # データベースに保存してからメソッドを実行
      #user.send_reset_password_instructions
      #expect(user.reset_password_token).not_to be_nil
    #end
  end
end
