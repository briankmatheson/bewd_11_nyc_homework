require 'addressable/uri'

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

    while commands.length > 0 do
      command = commands.shift
      if command == 'lookup'
        # we only ever want to do one lookup at a time
        arg_list['lookup'] << commands.shift
        urls << url(arg_list)
        return urls
      elsif command == 'artist'
        arg_list['artist'] << commands.shift
      elsif command == 'zip'
        arg_list['zip'] << commands.shift
      end
    end
    return urls(arg_list)
  end

  def url(arg_list)
    urls(arg_list).first
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
    artist_name = Addressable::URI.escape(artist_name)
    return "&name=#{artist_name}"
  end

  def lookup(artist_name)
    artist_by_name(artist_name)
  end

  def base_url
    "http://api.jambase.com/#{@query_type}?api_key=#{@apikey}&o=json"
  end
  
  def url(arg_list)
    # returns an array of urls to fetch or false
    # where arg_list is a hash of methods to build url
    query_string = ''
    puts arg_list

    if arg_list['lookup'].exists?
      query_string += lookup(arg_list['lookup'])
      urls << base_url + query_string
      return urls
    end

    arg_list['artist'].each do |artist_id|
      arg_list['zip'].each do |zip_code|
        urls << artist(artist_id) + zip(zip_code)
      end
    end
    if urls.size > 0
      return urls
    else
      return false
    end
  end
end
