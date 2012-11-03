require "#{File.dirname(__FILE__)}/document"

class Corpus

  def initialize
    @tokens = {}
  end

  def entry_count
    @tokens.values.inject(0, :+)
  end

  def add document
    document.each_token do |token|
      @tokens[token] = token_count(token) + 1
    end
  end

  def load_from_directory directory
    Dir.glob("#{directory}/*.txt") do |entry|
      IO.foreach(entry) do |line|
        add Document.new(line)
      end
    end
  end

  def token_count token
    @tokens[token] || 0
  end
end
