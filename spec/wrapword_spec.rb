# frozen_string_literal: true

require 'wrapword'
RSpec.describe Wrapword do
  include Wrapword
  it 'has a version number' do
    expect(Wrapword::VERSION).not_to be nil
  end

describe '#wrap' do
  it 'can return empty string when the word is empty' do
    expect(Wrapword.wrap('', 0)) .to eq('')
  end

  it 'can return the word when the word shorter than limit' do
    expect(Wrapword.wrap('word', 7)) .to eq('word')
  end

  it 'can split the one word in three' do
    expect(Wrapword.wrap('word', 3)) .to eq("wor\nd")
  end

  it 'can split one word many times' do
    expect(Wrapword.wrap('abcdefghij', 3)) .to eq("abc\ndef\nghi\nj")
  end

  it 'can split long long word' do
    expect(Wrapword.wrap('longlongword', 4)) .to eq("long\nlong\nword")
  end

  it 'can wrap three words after space' do
    expect(Wrapword.wrap('word word word', 6)) .to eq("word\nword\nword")
  end
  
  it 'can wrap text at the last space before the wrap length' do
    expect(Wrapword.wrap('word word', 5)) .to eq("word\nword")
    expect(Wrapword.wrap('word word word', 5)) .to eq("word\nword\nword")
    expect(Wrapword.wrap('word word word', 10)) .to eq("word word\nword")
  end
end 
end
