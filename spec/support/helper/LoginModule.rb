module LoginModule
  def login(user)
    visit new_user_session_path
    fill_in 'Name', with: user.name
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end