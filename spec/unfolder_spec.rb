require 'spec_helper'

describe Manilla::Unfolder do
  it 'should remove delimiter' do
    value = "Hello, w\r\norld!"
    value = Manilla.unfold(value, "\r\n")

    expect(value).to eq('Hello, world!')
  end

  it 'should provide consistent output between fold and unfold' do
    text = 'Lines of text SHOULD NOT be longer than 75 octets, (och hÃ¶r p Ã¥
    den) excluding the line break. Long content lines SHOULD be split into  a
    multiple line representations using a line "folding" technique. That is, a
    long line can be split between any two characters by inserting a CRLF
    immediately followed by a single linear white space character (i.e.,
    SPACE, US-ASCII decimal 32 or HTAB, US-ASCII decimal 9). Any sequence of
    CRLF followed immediately by a single linear white space character is
    ignored (i.e., removed) when processing the content type.'.encode('utf-8')

    folded_text = Manilla.fold(text, 2, "\r\n")
    unfolded_text = Manilla.unfold(folded_text, "\r\n")

    value = Manilla.fold(unfolded_text, 75, "\r\n")
    value = Manilla.unfold(value, "\r\n")

    expect(value).to eq(unfolded_text)
  end
end
