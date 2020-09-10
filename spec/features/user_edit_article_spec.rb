require "rails_helper"

feature "User edits new article" do
  before(:each) do
    @user = create(:user)
    @article = create(:article, user: @user)
  end

  scenario "successfully" do
    sign_in(@user)
    visit root_url
    
    click_link "Edit"
    fill_in "Title", with: "An edited title"
    click_on "Edit"

    expect(page).to have_content "An edited title"
  end
end
