require "rails_helper"

feature "User visits their profile" do
  before(:each) do
    @user = create(:user)
  end
  scenario "successfully" do
    sign_in(@user)
    visit root_url
    click_on "Profile"
    
    expect(page).to have_content 'Manage your articles'
  end
end
