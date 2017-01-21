feature 'New Invention' do
  scenario 'user adds an invention' do
    user = Fabricate(:user)
    user.confirm
    signin(user.email, user.password)
    visit new_invention_path
    within 'form#new_invention' do
      fill_in 'Title', with: 'R2D2'
      fill_in 'Description', with: "Everyone's favorite droid"
      select('button', from: 'Bits')
      click_button 'Create Invention'
    end
    expect(page).to have_content('R2D2')
  end
end
