require 'manilla/folder'
require 'manilla/unfolder'

require 'manilla/version'

module Manilla
  #
  # Breaks long lines of text into multiple delimited representations.
  #
  # @example Fold text on character
  #   Manilla.fold('Hello, world!', 8, "\r\n\s")
  #
  #   => Hello, w
  #       orld!
  #
  # @example Fold text on word
  #   Manilla.fold('Hello, world!', 8, "\r\n\s", :word)
  #
  #   => Hello,
  #       world!
  #
  # @param text [String] The text to be folded
  # @param maxwidth [Integer] The maximum length of a line of text
  # @param delimiter [String] String used to denote line boundaries
  # @param break_on [Symbol] Specifies whether to fold text on a character
  #                          (`:char`) or word (`:word`) (default: `:char`)
  #
  def self.fold(text, maxwidth, delimiter, break_on = :char)
    Manilla::Folder.call(text, maxwidth, delimiter, break_on)
  end

  def self.unfold(text, delimiter)
    Manilla::Unfolder.call(text, delimiter)
  end
end
