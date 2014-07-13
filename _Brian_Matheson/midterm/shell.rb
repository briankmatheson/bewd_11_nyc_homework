require "readline"
require_relative 'readable'
require_relative 'writable'

class Shell
  include Readable
  include Writable

  attr_accessor :prompt, :commands
  
  def initialize
    @saved_history = []
    self.read('jamcli.history')
    @saved_history.each do |string|
      Readline::HISTORY.push string
    end
    @commands = []
    @prompt = "> "
    while line = Readline.readline(prompt, true)
      if done(line)
        exit
        return
      elsif run?(line)
        run(commands)
        @commands = []
        @prompt = "> "
      else
        # split line on any whitespace and append
        line.split(" ").each do |word|
          @commands << word
        end
      end
      if @commands.include?("zip") && 
          @commands.include?("artist")
        @prompt = "! "
      end
    end
  end

  def run(commands)
    query = JamBaseQuery.new(commands)
    url = query.parse
    
    o = JamBase.new(url)
    
    if o.results?
      puts o.city + ", " + o.state
    else
      puts "No shows found."
    end
  end

  def run?(line)
    if prompt == "! " && line == ""
      return true
    elsif line == "run"
      return true
    else
      return false
    end
  end

  def done(line)
    if prompt == "> " && line == ""
      return true
    elsif line == "exit"
      return true
    elsif line == "quit" 
      return true
    else 
      return false
    end
  end

  def exit
    @saved_history = Readline::HISTORY.to_a
    self.write('jamcli.history')
  end
end
