require 'rails_helper'

RSpec.describe 'favorite', type: :system do
  let(:user) {create(:user)}
  
  
  describe 'creating favorites' do
    it 'can create the favorite by clicking the button' do
      
      post = create(:post)
      login(user)
      expect(page).to have_content('Signed in successfully.')
      
      visit("/posts/#{post.id}")
      find('.fa-bookmark').click
      expect(page).to have_css('.fa-solid')



    end
  end
end