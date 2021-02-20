require "rails_helper"

RSpec.describe "When I visit the tag index page" do
  it "lists all the tags" do
    article = Article.create!(title: "New Title", body: "New Body")
    tag1 = article.tags.create!(name: "tag1")
    tag2 = article.tags.create!(name: "tag2")
    tag3 = article.tags.create!(name: "tag3")

    visit tags_path

    expect(page).to have_content(tag1.name)
    expect(page).to have_content(tag2.name)
    expect(page).to have_content(tag3.name)
  end

  it "Has a link to delete each tag" do
    tag1 = Tag.create!(name: "tag1")
    tag2 = Tag.create!(name: "tag2")
    tag3 = Tag.create!(name: "tag3")

    visit tags_path

    click_link('Delete tag1')
    expect(page).to have_content(tag2.name)
    expect(page).to have_content(tag3.name)
    expect(page).not_to have_content(tag1.name)
  end
end
