#!/usr/bin/env ruby

require 'readline'
require_relative 'jambase'
require_relative 'jambasequery'

line = Readline.readline("> ", true)

# split line on any whitespace
commands = line.split(" ", 4)


query = JamBaseQuery.new(commands)
url = query.parse

o = JamBase.new(url)

if o.results?
  puts o.city + ", " + o.state
else
  puts "No shows found."
end
