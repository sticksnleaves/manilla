module Manilla
  #
  # Moves from a folded delimited representation to a single line
  # representation.
  #
  module Unfolder
    def self.call(text, delimiter)
      text.gsub(delimiter, '')
    end
  end
end
