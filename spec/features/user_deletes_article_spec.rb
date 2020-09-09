require "rails_helper"

feature "User deletes new article" do
  before(:each) do
    @user = create(:user, email: "mimi@example.com", password: "123456", username: "mimi")
    @article_to_delete = create(:article, title: "Random article", content: "Some content in here", date: "2020/3/18", user: @user)
  end

  scenario "successfully" do
    visit root_url
    sign_in(@user)
    click_on "Delete"
    
    expect(Article.count).to eq(0)
  end
end
