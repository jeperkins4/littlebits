require 'devise'

module LoginHelpers
  def login_user user, password = 'testPass'
    #visit new_user_session_path
    visit root_path
    sleep 1
    click_link 'Sign In' # Will trigger modal
    within '#new_user' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: password
      #click_on 'Sign me in!'
      click_on 'Sign in'
    end
    sleep 3
  end

  def signup_user
    #visit new_user_session_path
    visit root_path
    find('#sign_in_user').click_link('Login')
    within '#sign_up' do
      within '#devise-mini' do
        fill_in 'First Name', with: Faker::Name.first_name
        fill_in 'Last Name', with: 'Douglas'
        fill_in 'Email', with: Faker::Internet.email
        fill_in 'Phone', with: Faker::PhoneNumber.phone_number
        fill_in 'Password', with: 'password', match: :prefer_exact
        fill_in 'Password confirmation', with: 'password'
        #click_on 'Sign me in!'
        click_on 'Create my account'
      end
    end
  end

  def as_admin
    password = 'testPass'
    user = Fabricate(:user, name: 'Admin', password: password, password_confirmation: password)
    user.add_role 'admin'
    user.confirm
    login_user user, password
    yield user
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include LoginHelpers
end
