require "rails_helper"

feature "User creates new article" do
  before(:each) do
    @user = create(:user)
  end
  
  scenario "filling all the required fields" do
    
    sign_in(@user)
    visit root_url
    
    click_on "New"
    fill_in "Title", with: "New Article"
    fill_in "Content", with: "Lorem ipsum something"
    check "Is published"
    fill_in "article_date", with: "2020/8/9"
    click_on "Save"
  
   expect(page).to have_content "New Article"
   expect(page).to have_content "Lorem ipsum something"
  end

  scenario "not filling a required field" do
    
    sign_in(@user)
    visit root_url
    
    click_on "New"
    fill_in "Content", with: "Lorem ipsum something"
    fill_in "article_date", with: "2020/8/9"
    click_on "Save"

    expect(page).to have_content "can't be blank"
  end
end
