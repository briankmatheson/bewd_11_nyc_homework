#!/usr/bin/env ruby

require_relative 'writable'

class WritableTester
  include Writable
  attr_reader :data, :yow

  def initialize
    @data = { foo:'bar', baz:'xyzzy' }
    @foo = { grr:'2', blarg:'4' }
    @data[:aaaargh] = @foo

    @yow = "za"
  end
end

o = WritableTester.new
o.write('foo')
