require 'rails_helper'

RSpec.describe 'posts', type: :system do  
  let(:user){create(:user)}
 

  describe 'creating posts' do
    context 'positive' do
      it 'allows user to create a post with valid inputs' do
        login(user)
        click_link 'NewPost'
        fill_in 'タイトル：', with: 'test'
        fill_in '詳細説明', with: 'test content'
        select 'Jett', from: 'エージェント：'
        select 'Split', from: 'マップ：'
        click_button 'Create Post'
        expect(page).to have_content('Post was successfully created.')
      end
    end
    context 'negative' do
      context 'when tilte is blank' do
        it 'doesnt allow user to create a post' do
          login(user)
          click_link 'NewPost'
          fill_in 'タイトル：', with: ''
          fill_in '詳細説明', with: 'test content'
          select 'Jett', from: 'エージェント：'
          select 'Split', from: 'マップ：'
          click_button 'Create Post'
          expect(page).to have_content("Title can't be blank")
        end
      end

      
    end
  end

  describe 'editting posts' do
    let(:post) {create(:post, user_id: user.id)}
    context 'positive' do
      it 'allows user to edit the post' do

        login(user)   
        expect(page).to have_content('Signed in successfully.') #login の後 visit だとログインが保持されないため、応急処置(なぜ?)

        visit "/posts/#{post.id}/edit"
        fill_in 'タイトル：', with: 'editted title'
        fill_in '詳細説明', with: 'editted content'
        click_button 'Update Post'
        expect(page).to have_content('Post was successfully updated.')

      end
    end
    context 'negative'do
      it 'doesnt allow user to edit the post' do

        login(user)
        expect(page).to have_content('Signed in successfully.')

        visit "/posts/#{post.id}/edit"
        fill_in 'タイトル：', with: ''
        fill_in '詳細説明', with: 'editted content'
        click_button 'Update Post'
        expect(page).to have_content("Title can't be blank")
      end
    
    end
  end

  describe 'searching posts' do
     let(:post) {create(:post)}
     it 'can search posts based on map and agent' do

      login(user)
      expect(page).to have_content('Signed in successfully.')

      visit root_path
      label_map = "label[for= map#{post.map_id}]"
      label_agent = "label[for= agent#{post.agent_id}]"
      
      find(label_map).click
      find(label_agent).click
      click_button 'search'
      expect(page).to have_content(post.title)
    end
  end
end