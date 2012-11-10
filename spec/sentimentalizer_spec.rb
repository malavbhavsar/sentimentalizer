require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Sentimentalizer" do
  before do
    Sentimentalizer.setup
  end
  it "will error without a valid input" do
    expect{Sentimentalizer.analyze("")}.to raise_error
  end
  it "will return a vlid response with a valid input" do
    JSON.parse(Sentimentalizer.analyze("I hate not tests"))["sentiment"].should eq(":(")
  end
end
