require "rails_helper"

feature "User deletes new article" do
  before(:each) do
    @user = create(:user)
    @article_to_delete = create(:article, user: @user)
  end

  scenario "successfully" do
    sign_in(@user)
    visit root_url
    
    find(".btn-outline-danger").click
    
    expect(Article.count).to eq(0)
  end
end
