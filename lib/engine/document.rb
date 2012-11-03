class Document
  def initialize content
    @tokens = content.downcase.split.
      reject { |item| item.strip.empty? }.
      uniq
  end

  def each_token
    @tokens.each { |token| yield token }
  end
end
