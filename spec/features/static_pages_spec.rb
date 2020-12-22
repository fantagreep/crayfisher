RSpec.feature 'StaticPages', type: :feature do
  scenario 'Home' do
    visit root_url
    expect(page).to have_title "Crayfisher"
  end

  scenario 'About' do
    visit about_url
    expect(page).to have_title "About | Crayfisher"
  end
end
