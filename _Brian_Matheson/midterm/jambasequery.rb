

class JamBaseQuery
  attr_accessor :commands, :zip_code, :artist_id

  def initialize(commands)
    @commands = commands
    @apikey = '6wc8war5yfb7mnd3b8vxazyf'
    @query_type = 'events'
  end

  def parse
    commands = @commands
    arg_list = {}
    puts "commands length is " + commands.length.to_s
    
    while commands.length > 0 do
      command = commands.shift
      if command == 'artist'
        arg_list['artist'] = commands.shift
      elsif command == 'zip'
        arg_list['zip'] = commands.shift
      end
    end
    return url(arg_list)
  end

  def artist_by_id(artist_id)
    @artist_id = artist_id
    return "&artistId=#{artist_id}"
  end

  def artist(artist_id)
    artist_by_id(artist_id)
  end

  def zip(zip_code)
    @zip_code = zip_code
    return "&zipCode=#{zip_code}"
  end

  def artist_by_name(artist_name)
    @query_type = 'artists'
    return "&name=#{artist_name}"
  end

  def base_url
    "http://api.jambase.com/#{@query_type}?api_key=#{@apikey}&o=json"
  end
  
  def url(arg_list)
    # where arg_list is a hash of methods to build url
    query_string = ''
    arg_list.keys.each do |key|
      if key == 'artist'
        query_string += artist(arg_list[key])
      end
      if key == 'zip'
        query_string += zip(arg_list[key])
      end
    end
    if ! @artist_id.empty? && ! @zip_code.empty?
      return base_url + query_string
    else
      return false
    end
  end
end
