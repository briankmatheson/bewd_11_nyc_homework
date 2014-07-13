require_relative 'readable'
require_relative 'writable'

class JamBase
  include Readable
  include Writable

  attr_reader :data, :url

  def initialize(url)
    if self.read('jambase.dat')
      if @url == url
        return true
      else
        @url = url
        fetch_data_from_jambase
      end
    end
  end

  def fetch_data_from_jambase
    require 'rest-client'
    @data = JSON.load(RestClient.get(@url))
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
    if data["Info"]["TotalResults"].to_i > 0
      return data["Info"]["TotalResults"].to_i
    else
      return false
    end
  end
end
