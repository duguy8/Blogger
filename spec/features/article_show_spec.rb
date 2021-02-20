require "rails_helper"

describe "user sees one article" do
  describe "they link from the articles index" do
    it "displays information for one article" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end

    it "has a link to delete article from show page" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit article_path(article_1)

      expect(page).to have_link("Delete Article")

      click_link("Delete Article")

      expect(page).to have_content("Article deleted")
      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).not_to have_content(article_1.title)
    end
  end
end
