require 'htmlbeautifier/html_parser'
require 'htmlbeautifier/builder'

module HtmlBeautifier
  class Beautifier
    attr_accessor :tab_stops

    # Create a new Beautifier.
    #
    def initialize
      self.tab_stops = 2
    end

    # Beautify an HTML/HTML+ERB document
    # html should be a string
    # Returns a string
    #
    def beautify(html)
      ''.tap { |output|
        HtmlParser.new.scan html.strip, Builder.new(output, tab_stops)
      }
    end
  end
end
