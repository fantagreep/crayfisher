
RSpec.feature 'StaticPages', type: :feature do
  scenario 'Home' do
    visit root_url
    expect(page).to have_title "Home | Crayfisher"
  end
end
