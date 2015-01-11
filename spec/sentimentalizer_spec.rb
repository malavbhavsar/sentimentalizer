require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Sentimentalizer" do
  before do
    Sentimentalizer.setup
  end

  it "will error without a valid input" do
    expect{Sentimentalizer.analyze("")}.to raise_error
  end

  it "will return a valid ruby hash with a valid input" do
    Sentimentalizer.analyze("I hate not tests").sentiment.should eq(":(")
  end

  it "will return a valid json string with a valid input" do
    JSON.parse(Sentimentalizer.analyze("I hate not tests", true))["sentiment"].should eq(":(")
  end

  it "will assign a probability of .5 in the case of an unknown word" do
    Sentimentalizer.analyze("a;lsdnzi").overall_probability.should eq(0.5)
  end
end
