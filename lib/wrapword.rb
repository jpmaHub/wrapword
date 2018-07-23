# frozen_string_literal: true

require "wrapword/version"

module Wrapword

      def self.wrap(word, limit)
        return word if word.length <= limit
        space = limit
        space = space(word,limit) if space(word,limit) 
        "#{word[0...space]}\n#{wrap(word[space..-1].strip, limit)}"
      end

      def self.space(word,limit)
        word[0...limit].rindex(' ')
      end 

      def self.undo(word)
        return word.gsub("\n",' ')
      end
end
