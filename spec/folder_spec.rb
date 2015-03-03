require 'spec_helper'

describe Manilla::Folder do
  describe 'char' do
    it 'should fold at max width' do
      value = Manilla.fold('Hello, world!', 2, "\r\n")

      expect(value).to eq("He\r\nll\r\no,\r\n w\r\nor\r\nld\r\n!")
    end
  end

  describe 'word' do
    it 'should fold text on word' do
      value = Manilla.fold('Hello, world!', 8, "\r\n", :word)

      expect(value).to eq("Hello, \r\nworld!")
    end

    it 'should fold at max width if word is longer than max width' do
      value = Manilla.fold('Hello, world!', 2, "\r\n", :word)

      expect(value).to eq("He\r\nll\r\no,\r\n \r\nwo\r\nrl\r\nd!")
    end

    it 'should fold complex strings' do
      text = 'Lines of text SHOULD NOT be longer than 75 octets, (och hÃ¶r p Ã¥
      den) excluding the line break. Long content lines SHOULD be split into  a
      multiple line representations using a line "folding" technique. That is, a
      long line can be split between any two characters by inserting a CRLF
      immediately followed by a single linear white space character (i.e.,
      SPACE, US-ASCII decimal 32 or HTAB, US-ASCII decimal 9). Any sequence of
      CRLF followed immediately by a single linear white space character is
      ignored (i.e., removed) when processing the content type.'

      value = Manilla.fold(text, 75, "\r\n", :word)

      value.split("\r\n").each do |line|
        expect(line.bytesize).to be <= 75
      end
    end
  end
end
