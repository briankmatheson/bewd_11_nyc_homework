require "readline"
require_relative 'readable'
require_relative 'writable'

class Shell
  include Readable
  include Writable
  
  def initialize
    @saved_history = []
    self.read('jamcli.history')
    @saved_history.each do |string|
      Readline::HISTORY.push string
    end
    commands = []

    while line = Readline.readline("> ", true)
      if line == "exit" || line == "quit"
        exit
        return
      elsif line == "run"
        run(commands)
        commands = []
      else
        # split line on any whitespace and append
        commands << line.split(" ")
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
  
  def exit
    @saved_history = Readline::HISTORY.to_a
    self.write('jamcli.history')
  end
end
