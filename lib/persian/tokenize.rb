# -*- coding: UTF-8 -*-

# Persian class :: Tokenizers
class Persian
  # Basic persian word tokenizer
  # Return an array of words
  def self.basic_tokenizer(text)
    symbols = ['!', '﷼', ':', '؛', '؟', '،', '-']
    pair_pre = ['(', '{', '«', '<', '[']
    pair_post = [')', '}', '»', '>', ']']
    prepost = ["'", '"']

    # Split text with space characters
    splits = text.split(/\s/)

    return [''] if splits.empty?

    options = symbols + pair_pre + pair_post + prepost

    pattern = /[^#{Regexp.escape(options.join)}]+/
    tokens = []

    splits.each do |split|
      first, middle, last = split.partition(pattern)
      tokens << first.split unless first.empty?
      tokens << middle unless middle.empty?
      tokens << last.split unless last.empty?
    end

    tokens.flatten
  end

  # Split paragraphs
  # Return an array of paragraphs
  def self.split_paragraphs(text)
    text = text.split("\n").reject(&:empty?)
    text
  end
end
