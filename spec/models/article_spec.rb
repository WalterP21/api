require 'rails_helper'

RSpec.describe Article, type: :model do
  it "tests a number to be positive" do 
    expect(1).to be_positive #be_positive => 1.positive? == true
  end

  it "tests article object" do
    article = create(:article)
    expect(article.title).to eq("Sample article")
  end

  describe '#validations' do
    let(:article) { build(:article) }
    it "tests that factory is valid" do
      expect(article).to be_valid
    end

    it "has an invalid title" do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'has an invalid content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'validates the uniqueness of the slug' do
      article1 = create(:article)
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
      expect(article2.errors[:slug]).to include('has already been taken')
    end

  end

  describe '.recent' do
    it 'returns articles in the proper order' do
      old_article = create(:article, slug: "sample-article-3", created_at: 1.hour.ago)
      recent_article = create(:article)

      expect(described_class.recent).to eq(
        [recent_article, old_article]
      )

      recent_article.update_column(:created_at, 2.hours.ago)

      expect(described_class.recent).to eq(
        [old_article, recent_article]
      )
    end
  end
end
