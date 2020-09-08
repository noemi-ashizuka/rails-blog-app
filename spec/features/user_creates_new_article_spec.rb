require "rails_helper"

feature "User creates new article" do
  scenario "successfully" do
    visit root_url

    click_on "New"
    fill_in "Title", with: "New Article"
    fill_in "Content", with: "Lorem ipsum something"
    fill_in "article_date", with: "2020/8/9"
    click_on "Save"
  end
end