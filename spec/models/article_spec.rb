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
  end
end
