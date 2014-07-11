#!/usr/bin/env ruby

require_relative 'readable'

class ReadableTester
  include Readable
  attr_accessor :data, :yow

  def initialize(filename)
    if self.read('foo')
      puts 'read foo'
    else
      puts 'failed to read foo'
    end
  end
end

o = ReadableTester.new('foo')
puts o.data
puts o.yow

