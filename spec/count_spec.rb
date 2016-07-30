# -*- coding: UTF-8 -*-

require 'spec_helper'

describe 'persian counter methods' do
  it 'should return a hash of words as key and number of occurrence of word as value' do
    before = 'پرچم دوران هخامنشی به احتمال زیاد عقابی با بال های گشوده با قرص خورشیدی در پشت سر عقاب بوده است'
    after = {
      'پرچم' => 1,
      'دوران' => 1,
      'هخامنشی' => 1,
      'به' => 1,
      'احتمال' => 1,
      'زیاد' => 1,
      'عقابی' => 1,
      'با' => 2,
      'بال' => 1,
      'های' => 1,
      'گشوده' => 1,
      'قرص' => 1,
      'خورشیدی' => 1,
      'در' => 1,
      'پشت' => 1,
      'سر' => 1,
      'عقاب' => 1,
      'بوده' => 1,
      'است' => 1
    }
    expect(Persian.word_counter(before)).to eq(after)
  end

  it 'should return a hash of characters with their number of occurrence' do
    before = 'من غلام قمرم غیر قمر هیچ مگو'
    after = {
      'م' => 6,
      'ن' => 1,
      ' ' => 6,
      'غ' => 2,
      'ل' => 1,
      'ا' => 1,
      'ق' => 2,
      'ر' => 3,
      'ی' => 2,
      'ه' => 1,
      'چ' => 1,
      'گ' => 1,
      'و' => 1
    }

    expect(Persian.char_counter(before)).to eq(after)
  end
end