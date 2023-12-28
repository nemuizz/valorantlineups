require 'rails_helper'

RSpec.describe 'login', type: :system do
  let(:user) {create(:user)}
  it 'allows user to log in' do
    visit new_user_session_path
    fill_in 'Name', with: user.name
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end