require "rails_helper"

RSpec.describe "As a user" do
  it "displays tags name" do
    article = Article.create!(title: "New Title", body: "New Body")
    tag = article.tags.create!(name: "Name")

    visit article_path(article)
    click_link(tag.name)
    expect(page).to have_content(tag.name)
  end
end
