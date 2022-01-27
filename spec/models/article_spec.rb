require 'rails_helper'

RSpec.describe Article, type: :model do
  it "tests a number to be positive" do 
    expect(1).to be_positive #be_positive => 1.positive? == true
  end

  it "tests article object" do
    article = FactoryBot.create(:article)
    expect(article.title).to eq("Sample article")
  end
end
