class ClassificationResult
  attr_accessor :text, :overall_probability, :sentiment
  attr_reader :token_probabilities

  def initialize text
    @text = text
    @token_probabilities = []
    @sentiment = Sentiment::NEUTRAL
  end

  def to_json(*a)
    {
      text:        @text,
      probability: @overall_probability,
      sentiment:   @sentiment
    }.to_json(*a)
  end

end

class TokenProbability
  attr_accessor :token, :probability, :sentiment, :positive_total,
    :positive_matches, :negative_total, :negative_matches

  def initialize token, probability, sentiment, positive_total, positive_matches, negative_total, negative_matches
    @token, @probability, @sentiment, @positive_total, @positive_matches, @negative_total, @negative_matches = token, probability, sentiment, positive_total, positive_matches, negative_total, negative_matches
  end
end

class Sentiment
  POSITIVE = ':)'
  NEGATIVE = ':('
  NEUTRAL  = ':|'
end

