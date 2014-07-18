require          'readline'
require_relative 'readable'
require_relative 'writable'

class Shell
  include Readable
  include Writable

  attr_accessor :prompt, :commands, :results
  
  def initialize
    @zip = nil
    @saved_history = []
    self.read('jamcli.history')
    @saved_history.each do |string|
      Readline::HISTORY.push string
    end
    new_query
    init_commands
    @prompt = commands.to_s + "> "

    help

    while line = Readline.readline(prompt, true)
      if done?(line)
        exit
        return
      elsif new_query?(line)
        new_query
      elsif print?(line)
        line.split(" ").each do |word|
          @commands << word
        end
        parse_print
        init_commands
      elsif lookup?(line)
        a = line.split(" ", 2)
        lookup(a[1])
      elsif run?(line)
        run
        init_commands
      else
        # split line on any whitespace and append
        is_zip = false
        line.split(" ").each do |word|
          @commands << word
          if word == 'zip'
            is_zip = true
          end
          if is_zip 
            @zip = word
          end
        end
      end
      if @results.respond_to?('results?')
        @prompt = commands.to_s + "? "
      elsif @commands.include?("zip") && 
          @commands.include?("artist")
        @prompt = commands.to_s + "! "
      else
        @prompt = commands.to_s + "> "
      end
    end
  end

  def init_commands
    @commands = []
    if @zip && prompt.end_with?("> ")
      @commands << 'zip'
      @commands << @zip
    end
  end

  def run
    query = JamBaseQuery.new(@commands)
    url = query.parse
    
    @results = JamBase.new(url)
    
    print_detail(@results)
  end

  def lookup(name)

    query = JamBaseQuery.new(['lookup', name])
    url = query.parse
    @results = JamBase.new(url)

    if @results.results?
      if @results.results? == 1
        @commands.push 'artist'
        @commands.push @results.artist_by_name
      else @results.results? > 1
        puts @results.list_artists
      end
    else
      puts "No match for artist lookup."
    end
    @results = {}
  end

  def run?(line)
    if prompt.end_with?("! ") && line == ""
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
    puts
    puts
    puts "Thanks to www.jambase.com for providing"
    puts "an awesome database of live shows to see"
    puts
    puts "use directives to specify zip code and"
    puts "artist id.  Type run to execute query."
    puts ""
    puts "e.g. > artist 1977 zip 10010"
    puts "     ! run"
    puts "     ? new"
    puts "     > lookup the budos band"
    puts "     > zip 10010"
    puts "     ! [return]"
    puts "     ? print location"
    puts "     ? quit"
    puts
  end

  def help?(line)
    if prompt.end_with?("> ") && line == ""
      return true
    elsif line == "help"
      return true
    elsif line == "usage" 
      return true
    else 
      return false
    end
  end

  def new_query
    @prompt = "> "
    init_commands
    @results = nil
    @prompt = commands.to_s + "> "
  end

  def print?(line)
    if prompt.end_with?("? ") && line == ""
      if @results.respond_to?('results?') && @results.results?
        init_commands
        @commands.push "print"
        @commands.push "venue"
      else
        new_query
      end
      return true
    elsif line.match "^p"
      return true
    else 
      return false
    end
  end
  
  def lookup?(line)
    if @prompt.end_with?("> ") && line.match("^l")
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
  
  def print_detail(o)
    if o.respond_to?('results?') && o.results?
      puts o.date + ": " + o.venue + ": " + o.city + ", " + o.state
    else
      puts "No shows found."
    end
  end

  def print_date(o)
    if o.respond_to?('results?') && o.results?
      puts o.date
    else
      puts "No shows found."
    end
  end

  def print_location(o)
    if o.respond_to?('results?') && o.results?
      puts o.city + ", " + o.state
    else
      puts "No shows found."
    end
  end
  
  def print_venue(o)
    if o.respond_to?('results?') && o.results?
      puts o.venue
    else
      puts "No shows found."
    end
  end

  def parse_print
    if @commands[0].to_s.match('^p') && @commands.size == 2
      thing = @commands[1]
    else
      thing = 'venue'
    end

    if thing == 'venue'
      print_venue(@results)
    elsif thing.match '^l'
      print_location(@results)
    elsif thing.match '^v'
      print_venue(@results)
    elsif thing.match '^d'
      print_date(@results)
    end
  end

  def exit
    @saved_history = Readline::HISTORY.to_a
    self.write('jamcli.history')
  end
end
