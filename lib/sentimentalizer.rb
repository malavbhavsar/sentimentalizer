require 'json'
require "#{File.dirname(__FILE__)}/engine"


class Sentimentalizer

  def self.setup
    @analyser = Analyser.new
    @analyser.train_positive "#{File.dirname(__FILE__)}/data/positive"
    @analyser.train_negative "#{File.dirname(__FILE__)}/data/negative"
  end

  def self.analyze(sentence, as_json=nil)
    unless as_json
      @analyser.analyse(sentence)
    else
      @analyser.analyse(sentence).to_json
    end
  end

end
