module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation)
      visit new_user_registration_path
      within 'form#new_user' do
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        fill_in 'Password confirmation', :with => confirmation
        click_button 'Sign up'
      end
    end

    def signin(email, password)
      visit new_user_session_path
      within 'form#popup_new_user' do
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        click_button 'Sign in'
      end
    end
  end
end
