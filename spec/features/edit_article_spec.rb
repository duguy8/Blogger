require "rails_helper"

RSpec.describe "As a visitor" do
  describe "When I visit an articles show page" do
    it "has a link to a form to be updated" do
      article_1 = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article_1)

      expect(page).to have_link("Edit")
      click_link("Edit")

      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]",  with: "New Body!"
      click_on "Update Article"

      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
    end
  end
end
