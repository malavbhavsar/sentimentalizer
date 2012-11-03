require "#{File.dirname(__FILE__)}/corpus"
require "#{File.dirname(__FILE__)}/classifier"

class Analyser

  def initialize
    @positive = Corpus.new
    @negative = Corpus.new
  end

  def train_positive path
    puts 'Training analyser with +ve sentiment'
    @positive.load_from_directory path
    puts '+ve sentiment training complete'
  end

  def train_negative path
    puts 'Training analyser with -ve sentiment'
    @negative.load_from_directory path
    puts '-ve sentiment training complete'
  end

  def analyse sentence
    Classifier.new(@positive, @negative).classify(sentence)
  end

end
