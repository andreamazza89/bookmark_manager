feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up_passwords_match }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, andrea@example.com')
    expect(User.first.email).to eq('andrea@example.com')
  end

  scenario 'I cannot signup without an email' do
    expect { sign_up_empty_email }.not_to change(User, :count)
  end
end
