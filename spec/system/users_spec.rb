require 'rails_helper'

RSpec.describe 'user function', type: :system do
  let(:user) {create(:user)}
  
  describe 'when user not logged in' do
    
    describe 'user registration' do
      context 'positive' do
        it 'allows user to signup' do
          visit new_user_registration_path
          fill_in 'Name', with: 'test_user'
          fill_in 'Email', with: 'user_1@example.com'
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Sign up'
          expect(page).to have_content 'Welcome! You have signed up successfully'
        end
      end

      context 'email is blank' do
        it 'doesnt allow user to signup' do
          visit new_user_registration_path
          fill_in 'Name', with: 'test_user'
          fill_in 'Email', with: ''
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Sign up'
          
          expect(page).to have_content "Email can't be blank"
        end
      end

      context 'email is not unique' do
        it 'doesnt allow user to signup' do
          visit new_user_registration_path
          fill_in 'Name', with: 'test_user'
          fill_in 'Email', with: user.email
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Sign up'
          
          expect(page).to have_content 'Email has already been taken'
        end
      end

      describe 'access restrictions' do
        

        context 'posts/new' do #You need to sign in or sign up before continuing.
          it 'doesnt allow user to access' do
            visit '/posts/new'
            expect(page).to have_content 'You need to sign in or sign up before continuing.'
            expect(current_path).to eq new_user_session_path
          end
        end

        context 'posts/edit' do
          it 'doesnt allow user to access' do
            post = create(:post)
            visit "posts/#{post.id}/edit"
            expect(page).to have_content 'You need to sign in or sign up before continuing.'
            expect(current_path).to eq new_user_session_path
          end
        end

        

        
      end
    end
  end 

  describe 'when user logged in' do
    
    
    #{ login(user) }
    
    describe 'editting user' do
      context 'form is filled with valid inputs' do
        it 'allows user to edit userpage' do
          login(user)
          expect(page).to have_content('Signed in successfully.')

          visit edit_user_registration_path
          fill_in 'Email', with: user.email
          fill_in 'Current password', with: 'password'
          click_button 'Update'
          expect(page).to have_content 'Your account has been updated successfully.'
        end
      end
    
      context 'form is without password' do
        it 'dosent allow user to edit userpage' do
          login(user)
          expect(page).to have_content('Signed in successfully.')
          
          visit edit_user_registration_path
          fill_in 'Email', with: user.email
          fill_in 'Current password', with: ''
          click_button 'Update'
          expect(page).to have_content "Current password can't be blank"
        end
      end

      

    end
  end
end