def sign_up
  visit '/users/new'
  fill_in :email,    with: 'andrea@example.com'
  fill_in :password, with: 'monkey'
  click_button 'Sign up'
end
