require 'json'
require "#{File.dirname(__FILE__)}/engine"


class Sentimentalizer

  def self.setup
    @analyser = Analyser.new
    @analyser.train_positive "#{File.dirname(__FILE__)}/data/positive"
    @analyser.train_negative "#{File.dirname(__FILE__)}/data/negative"
  end

  def self.analyze(sentence)
    @analyser.analyse(sentence).to_json
  end

end
