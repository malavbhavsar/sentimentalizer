require 'json'
require "#{File.dirname(__FILE__)}/engine"

class Sentimentalizer

  def self.setup
    @analyser = Analyser.new

    Dir.glob("lib/data/dataset/*.txt") do |entry|
      IO.foreach(entry, encoding: Encoding::UTF_8) do |line|
        next unless line.split.last.match(/plus|minus/)

        if line.split.last.match(/plus/)    
          @analyser.add_positive Document.new(line)
        else
          @analyser.add_negative Document.new(line)
        end
      end
    end
  end

  def self.analyze(sentence, as_json=nil)
    unless as_json
      @analyser.analyse(sentence)
    else
      @analyser.analyse(sentence).to_json
    end
  end

end
