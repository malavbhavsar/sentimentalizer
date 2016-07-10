require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Sentimentalizer" do
  before do
    Sentimentalizer.setup
  end

  it "will error without a valid input" do
    expect{Sentimentalizer.analyze("")}.to raise_error
  end

  it "will return a valid ruby hash with a valid input" do
    expect(Sentimentalizer.analyze("I hate not tests").sentiment).to eq(":(")
  end

  it "will return a valid json string with a valid input" do
    expect(JSON.parse(Sentimentalizer.analyze("I hate not tests", true))["sentiment"]).to eq(":(")
  end

  it "will assign a probability of .5 in the case of an unknown word" do
    expect(Sentimentalizer.analyze("a;lsdnzi").overall_probability).to eq(0.5)
  end
end
