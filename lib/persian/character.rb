# -*- coding: UTF-8 -*-

# Persian class :: characters
class Persian
  # Replace Arabic characters with Persian characters.
  def self.character(text)
    AR_FA_CHAR.each { |k, v| text.gsub!(k, v) }
    text
  end

  # Remove extra spaces in text
  def self.remove_extra_spaces(text)
    text = text.split.join(' ')
    text = text.split('‌').join('‌')
    text
  end

  # Remove Arabic harecats from text
  def self.remove_harekats(text)
    HAREKATS.each { |v| text.gsub!(v, '') }
    text
  end

  # Replace general brackets with one type brackets
  # Default: 	0xAB & 	0xBB
  def self.general_brackets(text, left = '«', right = '»')
    text.gsub!(/"(.*?)"/, left + '\1' + right)
    text.gsub!(/\[(.*?)\]/, left + '\1' + right)
    text.gsub!(/\{(.*?)\}/, left + '\1' + right)
    text.gsub!(/\((.*?)\)/, left + '\1' + right)
    text
  end

  # Replace english characters with it's key persian value on standard persian keyboard
  # For now just support QWERTY keyboard
  def self.english_to_persian_char(text)
    EN_FA_KEYBOARD_CHAR.each { |k, v| text.gsub!(k, v) }
    text
  end

  # Replace standard persian keyboard characters with it's key persian value on english keyboard
  # For now just support QWERTY keyboard
  def self.persian_to_english_char(text)
    EN_FA_KEYBOARD_CHAR.each { |v, k| text.gsub!(k, v) }
    text
  end

  # Add '‌ی' after names that end with ه, ا, و
  def self.fix_y_after_vowel(text)
    text += '‌ی' if END_VOWEL.include? text[-1]
    text
  end

  # Replace Space with Zero-width none-joiner after می and نمی
  def self.replace_zwnj_mi(text)
    mi = 'می'
    nmi = 'نمی'
    text.gsub!(/(^|\s)(#{mi}|#{nmi})\s(\S+)/, '\1\2‌\3')
    text
  end

  # Resplace ست with \sاست if lastest character before \s is ا
  def self.ast(text)
    a = 'ا'
    ast = 'است'
    st = 'ست'

    text.gsub!(/(#{a})\s(#{ast})/, '\1' + st)
    text
  end

  # Remove keshide from text
  def self.keshide(text)
    text.gsub!(/ـ+/, '')
    text
  end

  # Use ی instead of ئ if next char is ی
  # Example پائیز => پاییز
  def self.replace_e_y(text)
    e = 'ئ'
    y = 'ی'
    text.gsub!(/#{e}(#{y})/, '\1\1')
    text
  end

  def self.three_dots(text)
    text.gsub!(/\.{3,}/, '…')
    text
  end

  def self.suffix(text)
    tar = 'تر'
    ee = 'ی'
    n = 'ن'
    ha = 'ها'
    ye = 'ی'
    text.gsub!(/\s+(#{tar}(#{ee}(#{n})?)?)|(#{ha}(#{ye})?)\s+/, '‌\1')
    text
  end

  def self.remove_extra_question_mark(text)
    mark = '؟'
    text.gsub!(/(#{mark}){2,}/, '\1')
    text
  end

  def self.add_zwnj(text, point)
    text = text.scan(/^.{#{point}}|.+/).join('‌')
    text
  end

  def self.remove_question_exclamation(text)
    question = '؟'
    exclamation = '!'
    text.gsub!(/(#{question})+(#{exclamation})+/, '\1\2')
    text
  end

  def self.remove_stopwords(text)
    stopwords = ['و', 'در', 'به', 'این', 'با', 'از', 'که', 'است', 'را']
    words = text.scan(/\S+/)
    keywords = words.select { |word| !stopwords.include?(word) }
    keywords.join(' ')
  end

  def self.remove_space_noghtevirgool(text)
    noghtevirgool = '؛'
    text.gsub!(/\s+(#{noghtevirgool})/, '\1')
    text
  end

  def self.remove_signs_after_noghtevirgool(text)
    signs = '[\.،؛:!؟\-…]'
    noghtevirgool = '؛'
    text.gsub!(/(#{noghtevirgool})[#{signs}]+/, '\1')
    text
  end

  def self.space_after_noghtevirgool(text)
    noghtevirgool = '؛'
    text.gsub!(/(#{noghtevirgool})(\S)/, '\1 \2')
    text
  end

  def self.remove_noghtevirgool_para_end(text)
    noghtevirgool = '؛'
    text.gsub!(/#{noghtevirgool}(\n|$)/, '.\1')
    text
  end

  def self.remove_noghtevirgool_baz_start(text)
    noghtevirgool = '؛'

    regex = /([\(\[«])[ ‌]*[#{noghtevirgool}]/
    text.gsub!(regex, '\1')
    text
  end
end
