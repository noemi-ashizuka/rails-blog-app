require "rails_helper"

feature "User visits homepage" do
  scenario "Successfully" do
    visit root_url

    expect(page).to have_css 'h1', text: 'Articles'
  end
end
