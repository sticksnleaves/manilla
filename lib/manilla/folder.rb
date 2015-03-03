module Manilla
  #
  # Breaks long logical lines of text into multiple delimited representations.
  # Lines can be folded into a set width of octets excluding line breaks.
  #
  module Folder
    def self.call(text, maxwidth, delimiter, break_on)
      lines = []

      value = text.strip
      value = value.encode('utf-8', 'binary', invalid: :replace, undef: :replace, replace: '')
      value = value.gsub(/\n+/, '')
      value = value.gsub(/\s{2,}/, '')

      while value.size > maxwidth
        count = maxwidth

        while count
          break_index = nil
          break_pos = nil
          line = value[0, count]

          if break_on == :word
            break_index = line.rindex(/\s/)
            break_pos = break_index + 1 if break_index
            line = line[0, break_pos] if break_pos

            count = break_pos || maxwidth
          end

          oct = line.size

          if oct > maxwidth
            count -= oct - maxwidth
          else
            lines << line
            value = value[count, value.size]
            break
          end
        end
      end

      lines << value unless value.strip.empty?

      lines.join(delimiter)
    end
  end
end
