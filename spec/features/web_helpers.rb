def sign_up_passwords_match
  visit '/users/new'
  fill_in :email,                 with: 'andrea@example.com'
  fill_in :password,              with: 'monkey'
  fill_in :password_confirmation, with: 'monkey'

  click_button 'Sign up'
end

def sign_up_passwords_do_not_match
  visit '/users/new'
  fill_in :email,                 with: 'andrea@example.com'
  fill_in :password,              with: 'monkey'
  fill_in :password_confirmation, with: 'fucking_monkey'

  click_button 'Sign up'
end

def sign_up_empty_email
  visit '/users/new'
  fill_in :email,                 with: ''
  fill_in :password,              with: 'monkey'
  fill_in :password_confirmation, with: 'monkey'

  click_button 'Sign up'
end
