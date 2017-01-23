feature 'New Invention' do
  scenario 'user edits an invention' do
    user = Fabricate(:user)
    user.confirm
    invention = Fabricate(:invention, title: 'R2D2', user: user)
    signin(user.email, user.password)
    visit edit_invention_path(invention)
    within "form#edit_invention_#{invention.id}" do
      fill_in 'Title', with: 'C3PO'
      select('pulse', from: 'Bits')
      click_button 'Update Invention'
    end
    expect(page).to have_content('C3PO')
  end
end
