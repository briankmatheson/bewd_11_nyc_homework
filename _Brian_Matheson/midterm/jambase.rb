require_relative 'readable'
require_relative 'writable'

class JamBase
  include Readable
  include Writable
  
  attr_accessor :data

  def initialize(url)
    @cache={}
    @cache[url]={}
    if self.read('jambase.dat') &&
        @cache[url][:data].class == Hash &&
        @cache[url][:time] > (Time.now - 86400)
      puts "Using cached data"
    else
      fetch_data_from_jambase(url)
    end
    data = @cache[url][:data]
  end

  def fetch_data_from_jambase(url)
    require 'rest-client'
    @cache[url][:data] = JSON.load(RestClient.get(url))
    @cache[url][:time] = Time.now
    
    self.write('jambase.dat')
  end

  def venue
    data["Events"][0]["Venue"]["Name"] 
  end
  
  def city
    if results?
      return data["Events"][0]["Venue"]["City"]
    else
      return nil
    end
  end

  def state
    if results?
      return data["Events"][0]["Venue"]["State"]
    else
      return nil
    end
  end

  def date
    if results?
      return data["Events"][0]["Date"]
    else
      return nil
    end
  end

  def artist_by_name
    if results?
      return data["Artists"][0]["Id"].to_s
    else
      return nil
    end
  end

  def list_artists
    a = []

    data["Artists"].each do |artist|
      a.push artist["Id"].to_s + ": " + artist["Name"].to_s
    end
    return a
  end    
  
  def results?
    if data.class == Hash
      if data["Info"]["TotalResults"].to_i > 0
        return data["Info"]["TotalResults"].to_i
      end
    else
      return false
    end
  end
end
