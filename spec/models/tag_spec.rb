require "rails_helper"

describe Tag, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:taggings)}
    it {should have_many(:articles).through(:taggings)}
  end

  describe "instance methods" do
    it "can convert names" do
      article = Article.create(title: "new", body: "Stuff")
      one = article.tags.create(name: "tag1")
      expect(one.to_s).to eq("tag1")
    end
  end
end
