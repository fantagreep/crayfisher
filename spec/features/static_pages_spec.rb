RSpec.feature 'StaticPages', type: :feature do
  scenario 'Home' do
    visit root_url
    expect(page).to have_title "Crayfisher"
    expect(page).to have_link, href: root_path
    expect(page).to have_link, href: about_path
    expect(page).to have_link, href: signup_path
  end

  scenario 'About' do
    visit about_url
    expect(page).to have_title "About | Crayfisher"
  end
end
