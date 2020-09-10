require "rails_helper"

feature "User edits new article" do
  before(:each) do
    @user = create(:user)
    @article = create(:article, user: @user)
  end

  scenario "successfully" do
    visit root_url
    sign_in(@user)

    click_link "Edit"
    fill_in "Title", with: "An edited title"
    click_on "Edit"

    expect(page).to have_content "An edited title"
  end
end
