require 'pragmatic_tokenizer'
class Document
  def initialize content
    @tokens = PragmaticTokenizer::Tokenizer.new({language: 'pl', numbers: :none, remove_stop_words: true}).tokenize(content)
    @tokens.reject!{|el| el.match(/,|\.|\:|\)|\(|\-|\_|\+|zł|pln/) }
  end

  def each_token
    @tokens.each { |token| yield token }
  end
end
