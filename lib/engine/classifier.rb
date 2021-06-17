require "#{File.dirname(__FILE__)}/document"
require "#{File.dirname(__FILE__)}/classification_result"

class Classifier

  UNKNOWN_WORD_STRENGTH = 1.0
  UNKNOWN_WORD_PROBABILITY = 0.5
  TOLERANCE = 0.05

  STOP_WORDS = File.open('lib/data/stopwords.txt').read.split(/\n/)

  def initialize positive_corpus, negative_corpus
    @positive_corpus = positive_corpus
    @negative_corpus = negative_corpus
  end

  def classify sentence
    result = ClassificationResult.new sentence

    Document.new(sentence).each_token do |token|
      next if STOP_WORDS.include? token

      positive_count = @positive_corpus.token_count token
      negative_count = @negative_corpus.token_count token

      token_probability = calculate_probability(
        positive_count, @positive_corpus.entry_count,
        negative_count, @negative_corpus.entry_count)

        record_probability token_probability

        result.token_probabilities.push TokenProbability.new(
          token, token_probability, @positive_corpus.entry_count,
          positive_count, @negative_corpus.entry_count,
          negative_count, calculate_sentiment(token_probability)
        )
    end

    result.overall_probability = combine_probabilities
    result.sentiment = calculate_sentiment result.overall_probability

    result
  end

  private

  def calculate_probability positive_count, positive_total, negative_count, negative_total
    total = positive_count + negative_count
    positive_ratio = positive_count.to_f / positive_total
    negative_ratio = negative_count.to_f / negative_total

    probability = positive_ratio.to_f / (positive_ratio + negative_ratio)
    probability = 0 if probability.nan?

    ((UNKNOWN_WORD_STRENGTH*UNKNOWN_WORD_PROBABILITY) + (total * probability)) / (UNKNOWN_WORD_STRENGTH+total)
  end

  def record_probability probability
    return if probability.nan?

    @total_probability = 1 if @total_probability == 0 || @total_probability.nil?
    @inverse_total_probability = 1 if @inverse_total_probability == 0 || @inverse_total_probability.nil?

    @total_probability = @total_probability * probability
    @inverse_total_probability = @inverse_total_probability*(1-probability)
  end

  def calculate_sentiment probability
    return Sentiment::NEGATIVE if probability <= (UNKNOWN_WORD_PROBABILITY - TOLERANCE)
    return Sentiment::POSITIVE if probability >= (UNKNOWN_WORD_PROBABILITY + TOLERANCE)
    Sentiment::NEUTRAL
  end

  def combine_probabilities
    @total_probability / (@total_probability + @inverse_total_probability)
  end
end
