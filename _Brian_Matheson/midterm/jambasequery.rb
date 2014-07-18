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
    arg_list = { 'artist' => [], 'zip' => [], 'lookup' => [] }

    while commands.length > 0 do
      command = commands.shift
      if command == 'lookup'
        url_list = []
        # we only ever want to do one lookup at a time
        arg_list['lookup'] << commands.shift
        url_list << url(arg_list)
        return url_list
      elsif command == 'artist'
        arg_list['artist'] << commands.shift
      elsif command == 'zip'
        arg_list['zip'] << commands.shift
      end
    end
    return urls(arg_list)
  end

  def url(arg_list)
    if urls(arg_list).empty?
      return false
    else
       urls(arg_list).first
    end
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
  
  def urls(arg_list)
    # returns an array of urls to fetch or an empty array
    # where arg_list is a hash of methods to build url
    query_string = ''
    url_list = []

    if ! arg_list['lookup'].empty?
      query_string += lookup(arg_list['lookup'].first)
      url_list << base_url + query_string
      return url_list
    end

    arg_list['artist'].each do |artist_id|
      arg_list['zip'].each do |zip_code|
        url_list << base_url + artist(artist_id) + zip(zip_code)
      end
    end
    return url_list
  end
end
