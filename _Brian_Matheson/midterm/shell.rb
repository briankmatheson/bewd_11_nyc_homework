require "readline"
require_relative 'readable'
require_relative 'writable'

class Shell
  include Readable
  include Writable

  attr_accessor :prompt, :commands, :results
  
  def initialize
    @saved_history = []
    self.read('jamcli.history')
    @saved_history.each do |string|
      Readline::HISTORY.push string
    end
    @commands = []
    @prompt = "> "

    help

    while line = Readline.readline(prompt, true)
      if done?(line)
        exit
        return
      elsif new_query?(line)
        @prompt = '> '
      elsif command?(line)
        puts ": " + @commands.to_s
      elsif lookup?(line)
        a = line.split(" ", 2)
        lookup(a[1])
      elsif run?(line)
        run
        @commands = []
        @prompt = "? "
      elsif print?(line)
        line.split(" ").each do |word|
          @commands << word
        end
        parse_print
        @commands = []
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

  def run
    query = JamBaseQuery.new(@commands)
    url = query.parse
    
    @results = JamBase.new(url)
    
    print_venue(@results)
  end

  def lookup(name)

    query = JamBaseQuery.new(['lookup', name])
    url = query.parse
    
    @results = JamBase.new(url)
    
    @commands.push 'artist'
    @commands.push @results.artist_by_name.to_s
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

  def done?(line)
    if line == "exit"
      return true
    elsif line == "quit" 
      return true
    else 
      return false
    end
  end

  def help
    puts "use directives to specify zip code and"
    puts "artist id.  Type run to execute query."
    puts ""
    puts ""
    puts "e.g. > artist 1977 zip 10010"
    puts "     > run"
    puts
  end

  def help?(line)
    if prompt == "> " && line == ""
      return true
    elsif line == "help"
      return true
    elsif line == "usage" 
      return true
    else 
      return false
    end
  end

  def print?(line)
    if prompt == "? " && line == ""
      @commands = []
      @commands.push "print"
      @commands.push "venue"
      return true
    elsif line.match "^p"
      return true
    else 
      return false
    end
  end
  
  def lookup?(line)
    if @prompt == '> ' && line.match("^l")
      return true
    else 
      return false
    end
  end
  
  def command?(line)
    if line.match("^c")
      return true
    else 
      return false
    end
  end

  def new_query?(line)
    if line.match("^n")
      return true
    else 
      return false
    end
  end
  
  def print_location(o)
    if o.results?
      puts o.city + ", " + o.state
    else
      puts "No shows found."
    end
  end
  
  def print_venue(o)
    if o.results?
      puts o.venue
    else
      puts "No shows found."
    end
  end

  def parse_print

    puts "commands.size = " + @commands.size.to_s

    if @commands[0].to_s.match('^p') && @commands.size == 2
      thing = @commands[1]

      puts "thing is " + thing
    else
      thing = 'venue'
    end

    if thing == 'venue'
      print_venue(@results)
    elsif thing.match '^l'
      print_location(@results)
    end
  end

  def exit
    @saved_history = Readline::HISTORY.to_a
    self.write('jamcli.history')
  end
end