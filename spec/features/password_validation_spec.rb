feature 'Password validation' do
  context 'Sign_up' do
    scenario 'User enters wrong password in password confirmation box' do
      expect { sign_up_passwords_do_not_match }.not_to change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content 'Password and confirmation password do not match'
    end
  end 
end
